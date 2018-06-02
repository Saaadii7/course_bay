class Service < ApplicationRecord
	mount_uploader :picture,FileUploader

	has_many :images
	has_many :videos
	has_many :documents
	has_many :sounds

end
