class Post < ApplicationRecord
	mount_uploader :photo ,FileUploader
	belongs_to :brand
	belongs_to :category
	belongs_to :sub_category
	belongs_to :user
	belongs_to :type, foreign_key: "ptype", class_name: "Type"
	has_many   :bids

end
