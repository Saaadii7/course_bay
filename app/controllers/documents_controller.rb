class DocumentsController < ApplicationController

	def create

		if params[:document][:document]
			params[:document][:document].each do |doc|
				Document.create(document: doc, service_id: params[:document][:service_id])
			end 
		end
		# @image = Image.create(image_params)
		respond_to do |format|
	        format.html { redirect_to authenticated_root_path, notice: 'Document was successfully created.' }
	        # format.json { render :show, status: :created, location: @image }
	    end
	end

	def favourite_toggle
		@doc = Document.find_by_id(params[:element_id])
		if params[:favourite] == "true"
			current_user.favourite_documents << @doc
			respond_to do |format|
		        format.html { redirect_to authenticated_root_path, notice: 'Documents become Favourite.' }
		        # format.json { render :show, status: :created, location: @image }
		    end
		else
			current_user.favourite_documents.delete(@doc)
			respond_to do |format|
		        format.html { redirect_to authenticated_root_path, notice: 'Documents deleted from Favourites.' }
		        # format.json { render :show, status: :created, location: @image }
		    end
		end
	end

private
	def image_params
		# params.require(:image).permit(:image)
	end
end
