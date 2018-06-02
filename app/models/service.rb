class Service < ApplicationRecord
	mount_uploader :picture,ImageUploader

	has_many :images
	has_many :videos
	has_many :documents
	has_many :sounds

end
