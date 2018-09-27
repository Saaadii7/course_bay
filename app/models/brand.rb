class Brand < ApplicationRecord
  has_many :posts
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories

end
