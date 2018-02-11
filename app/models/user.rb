class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :image, FileUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_and_belongs_to_many :images 
  has_and_belongs_to_many :favourite_images, :class_name => "Image"
  has_and_belongs_to_many :favourite_documents, :class_name => "Document"
  has_and_belongs_to_many :favourite_sounds, :class_name => "Sound"

  # has_and_belongs_to_many :favourite_videos, :class_name => "Video", dependent: :destroy


  # before_action :authenticate_user!

end
