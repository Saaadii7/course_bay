class Sound < ApplicationRecord
	mount_uploader :sound,FileUploader
 	has_and_belongs_to_many :users
	belongs_to :service
 	
end
