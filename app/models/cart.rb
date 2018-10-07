class Cart < ApplicationRecord
	belongs_to :user
	has_many :shopping_carts
	has_many :posts, through: :shopping_carts

	def total_price
		total = 0
		self.shopping_carts.each do |c|
			if c.quantity.to_i > 0 && c.post.price.to_i  > 0
				total += c.quantity*c.post.price.to_i
			else
				return 0
			end
		end
		return total
	end
end
