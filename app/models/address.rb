class Address < ApplicationRecord
	belongs_to :user
	belongs_to :province
	belongs_to :city
end
