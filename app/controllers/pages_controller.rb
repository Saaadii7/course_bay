class PagesController < ApplicationController

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
		@documents  = Document.all
		@services = Service.all
	end

	def contact
	end

	def about 
	end

	def pay 
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

end
