class PagesController < ApplicationController

	def index
		@image = Image.new
		@document = Document.new
		@sound = Sound.new
		@video = Video.new

		@images = Image.all
		@documents = Document.all
		@sounds = Sound.all
		@videos = Video.all

		@favourite_images = current_user.favourite_images
		@favourite_documents = current_user.favourite_documents
		@favourite_sounds = current_user.favourite_sounds
		@favourite_videos = current_user.favourite_videos
	end 

	def contact
	end

	def about 
	end

end
