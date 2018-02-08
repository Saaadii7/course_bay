class PagesController < ApplicationController

	def index
		@image = Image.new
		@images = Image.all
		@favourite_images = current_user.favourite_images
	end 

end
