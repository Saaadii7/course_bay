# class Asset < ActiveRecord::Base
#   include Uploader::Asset
# end

# class Picture < Asset
#   mount_uploader :data, PictureUploader, mount_on: :data_file_name
#   validates :data, file_size: { maximum: 5.megabytes.to_i }

#   def thumb_url
#     url(:thumb)
#   end
# end
class Video < ApplicationRecord
	mount_uploader :video,VideoUploader
 	has_and_belongs_to_many :users
	belongs_to :service
 	

 	def set_success(format, opts)
		self.success = true
	end
end
