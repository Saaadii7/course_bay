class SubCategory < ApplicationRecord
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories
  has_many :brands
  has_many :posts
end
