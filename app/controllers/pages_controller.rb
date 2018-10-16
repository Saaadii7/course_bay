class PagesController < ApplicationController
	before_action :check_roles, only: :dashboard
	def index
		@image = Image.new
		@document = Document.new
		@sound = Sound.new
		@video = Video.new
		@service = Service.new

		@images = Image.all.includes(:service)
		@documents = Document.all.includes(:service)
		@sounds = Sound.all.includes(:service)
		@videos = Video.all.includes(:service)
		@services = Service.all
		@subcategories = SubCategory.all
		#@user= User.all
		

		# @favourite_images = current_user.favourite_images
		# @favourite_documents = current_user.favourite_documents
		# @favourite_sounds = current_user.favourite_sounds
		# @favourite_videos = current_user.favourite_videos

		@favourite_images = []
		@favourite_documents = []
		@favourite_sounds = []
		@favourite_videos = []

	end

	def home
		@subcategories = SubCategory.all
		@posts = Post.simple_posts
		@brands = Brand.all
	end

	def contact
		@services = Service.all
	end

	def about
	end

	def pay
		@services = Service.all
	end

	def therapists
		@services = Service.all
	end

	def galleryWithGrid
		@services = Service.all
	end

	def galleryWithOutGrid
		@services = Service.all
	end

	def adminpanel
	end

	def check_roles
		if current_user.has_role? :admin
			redirect_to adminpanel_path
		end
		if current_user.has_role? :user
			redirect_to home_path
		end
	end

	def users
		 @users=Role.find_by_name('user').users
	end

	def posts
	
	end

	def categories
	end

	def subcategories
	end
	def profile
		@user = current_user
		if current_user.address
			@address = current_user.address
		else
			@address = current_user.build_address
		end
	end

	def checkout
		@post= Post.all
		@paymentmethod = PaymentMethod.all
		@orders= Order.all
		@provinces = Province.all
		@cities = City.all
		@cart = Cart.all
		@user = current_user
		if current_user.address
			@address = current_user.address
		else
			@address = current_user.build_address
		end
		
	end
	
end
