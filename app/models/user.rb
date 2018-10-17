class User < ApplicationRecord
  rolify :before_add => :before_add_method
  before_save :assign_role

  mount_uploader :image, FileUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :transactions
  has_many :emails
  has_many :posts
  has_many :bids
  has_many :orders
  has_one  :address
  has_one  :cart

  # has_and_belongs_to_many :images
  has_and_belongs_to_many :favourite_images, :class_name => "Image"
  has_and_belongs_to_many :favourite_documents, :class_name => "Document"
  has_and_belongs_to_many :favourite_sounds, :class_name => "Sound"
  has_and_belongs_to_many :favourite_videos, :class_name => "Video", dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def before_add_method(role)
  end
  def assign_role
    if !self.has_role? :admin
      self.add_role :user
    end
  end
  def isUser
    self.has_role? (:user)
  end
  def isAdmin
    self.has_role? (:admin)
  end

  def name
    return self.first_name + ' ' + self.last_name  
  end
  # before_action :authenticate_user!

end
