class Image < ApplicationRecord
	mount_uploader :image,FileUploader
 	has_and_belongs_to_many :users
	belongs_to :service
end