class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items
	belongs_to :payment_method

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

