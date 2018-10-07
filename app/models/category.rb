class Category < ApplicationRecord
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :sub_categories
  has_and_belongs_to_many :brands
  has_many :posts

end
