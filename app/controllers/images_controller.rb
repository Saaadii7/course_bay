class ImagesController < ApplicationController

	def create
		if params[:image][:image]
			params[:image][:image].each do |img|
				Image.create(image: img, service_id: params[:document][:service_id])
			end 
		end
		# @image = Image.create(image_params)
		respond_to do |format|
	        format.html { redirect_to authenticated_root_path, notice: 'Image was successfully created.' }
	        # format.json { render :show, status: :created, location: @image }
	    end
	end

	def favourite_toggle
		@image = Image.find_by_id(params[:element_id])
		@favourite_images = current_user.favourite_images
		if params[:favourite] == "true"
			@favourite_images << @image
			respond_to do |format|
		        # format.html { redirect_to authenticated_root_path, notice: 'Image become Favourite.' }
		        format.js
		    end
		else
			@favourite_images.delete(@image)
			respond_to do |format|
		        # format.html { redirect_to authenticated_root_path, notice: 'Image deleted from Favourites.' }
		        format.js
		    end
		end
	end

private
	def image_params
		# params.require(:image).permit(:image)
	end

end
