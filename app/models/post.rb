class Post < ApplicationRecord

	scope :simple_posts, ->{ joins(:type).where(["types.name = (?) ", "New"] )}
	scope :mobile_and_tablets_posts, ->{ joins(:type).where(["types.name = (?) AND category_id = (?)", "New", "4"] )}
	scope :men_posts, ->{ joins(:type).where(["types.name = (?) AND category_id = (?)", "New", "2"] )}
	scope :women_posts, ->{ joins(:type).where(["types.name = (?) AND category_id = (?)", "New", "3"] )}
	scope :available, ->{ where(status: true) }
	scope :not_available, ->{ where(status: false) }


	scope :simple_hidden_posts, ->{ joins(:type).where(["types.name = (?) AND status = (?)", "New", "false"] )}

	scope :auction_posts, ->{ joins(:type).where(["types.name = (?) ", "Used"] )}
	scope :auction_hidden_posts, ->{ joins(:type).where(["types.name = (?) AND status = (?)", "Used", "false"] )}

	mount_uploader :photo ,FileUploader
	belongs_to :brand
	belongs_to :category
	belongs_to :sub_category
	belongs_to :user
	belongs_to :type, foreign_key: "ptype", class_name: "Type"
	has_many   :bids
	has_many   :order_items
 	has_many :shopping_carts
	has_many :carts, through: :shopping_carts

	def isSimple?
		return self.type.name=="New"
	end
	def isAuction?
		return self.type.name=="Used"
	end
	def current_bid_id
		if self.isSimple?
			return -1
		else
			if self.bids.length > 0
				max = self.bids.first
				self.bids.each do |bid|
					max = ( bid.price > max.price )? bid : max;
				end
				return max.id
			else
				return -1 
			end
		end
	end
	def current_bid
		if self.current_bid_id == -1
			return "No Bid placed yet Or This post cant has bid"
		else
			Bid.find_by_id self.current_bid_id
		end
	end

	def self.check_post_expiry
		
		Post.auction_posts.each do |p|
			 if p.end_datetime > (Date.today && Time.now)

			 else
			 	if p.bids.count == 0
					p.status = false
					p.save
				else 
					 user_won = p.current_bid.user
					 order = Order.new(user_id: user_won.id, cart_id: user_won.cart.id, address_id: user_won.address.id, payment_method_id: 1, status:"processing")
					 order.save
					 OrderItem.create(order_id: order.id, post_id:p.id, quantity: 1)	
					 p.status = false
					 p.save
				end

		end
		#check posts ending time if greater then current time and date  do nothing else less or equal find (bids.post) 
		#if no bid make status false 
		#if bid find currentbid (current_bid.user_id)
		#create order by user_id, user_id.cart_id, user_id.address.address_id, method_id 
		#must address before
		#create orderitem of current post 
		#make post status false  
		#post show before action check paymentmethod present if not present redirect to profile 

		end
	end

end
