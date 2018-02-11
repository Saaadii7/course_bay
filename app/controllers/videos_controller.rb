class VideosController < ApplicationController

	def create
		if params[:video][:video]
			params[:video][:video].each do |vid|
				Video.create(video: vid)
			end 
		end
		# @image = Image.create(image_params)
		respond_to do |format|
	        format.html { redirect_to authenticated_root_path, notice: 'Video was successfully created.' }
	        # format.json { render :show, status: :created, location: @image }
	    end
	end

	def favourite_toggle
		@image = Image.find_by_id(params[:image_id])
		if params[:favourite] == "true"
			current_user.favourite_images << @image
			respond_to do |format|
		        format.html { redirect_to authenticated_root_path, notice: 'Image become Favourite.' }
		        # format.json { render :show, status: :created, location: @image }
		    end
		else
			current_user.favourite_images.delete(@image)
			respond_to do |format|
		        format.html { redirect_to authenticated_root_path, notice: 'Image deleted from Favourites.' }
		        # format.json { render :show, status: :created, location: @image }
		    end
		end
	end


private
	def image_params
		params.require(:image).permit(:image)
	end

end
