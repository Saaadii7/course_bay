class Brand < ApplicationRecord
  mount_uploader :photo ,FileUploader
  has_many :posts
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories

end
