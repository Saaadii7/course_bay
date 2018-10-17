class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items
	belongs_to :address

	belongs_to :payment_method

	before_create do
	  self.order_items.each do |item|
	    if item.post.isSimple?
	      if item.post.quantity >= item.quantity
	        item.post.quantity = item.post.quantity - item.quantity
	      else
	        item.post.quantity = 0
	      end
	      item.post.save
	    end
	end
	end
	def total_price
		total = 0
		self.order_items.each do |c|
			if c.quantity.to_i > 0 && c.post.price.to_i  > 0
				total += c.quantity*c.post.price.to_i
			else
				return 0
			end
		end
		return total
	end
end

