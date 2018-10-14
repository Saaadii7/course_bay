class Post < ApplicationRecord

	
	scope :simple_posts, -> { joins(:type).where("types.name = 'New'")}
	scope :auction_posts, -> { joins(:type).where("types.name = 'Used'")}

	
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

end
