class Document < ApplicationRecord
	mount_uploader :document,FileUploader
 	has_and_belongs_to_many :users
end
