class OrderItem < ApplicationRecord
	belongs_to :post
	belongs_to :order
end
