class Tag < ApplicationRecord
  has_and_belongs_to_many :sub_categories
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :brands
end
