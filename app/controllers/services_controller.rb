class ServicesController < ApplicationController

	def create
		@service = Service.create(service_params)
		respond_to do |format|
	        format.html { redirect_to authenticated_root_path, notice: 'Service was successfully created.' }
	        # format.json { render :show, status: :created, location: @image }
	    end
	end

private
	def service_params
		params.require(:service).permit(:name,:description,:minilogo,:picture,:hover_name)
	end
end
