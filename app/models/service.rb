
class Service < ApplicationRecord
	mount_base64_uploader :picture,ImageUploader

	has_many :images
	has_many :videos
	has_many :documents
	has_many :sounds
	after_create :decode
	
	def decode
		self.decode_base64_image self.picture
	end
	
	def decode_base64_image(encoded_file)
		# Base64.encode64(File.open(encoded_file.path) {|img| img.read})
		json = {}
		json["filename"] = encoded_file.filename
		json["content_type"] = encoded_file.content_type
		json["data"] = Base64.encode64(File.read(encoded_file.path))
		self.update(image: json)
	  	return json
	end
end
