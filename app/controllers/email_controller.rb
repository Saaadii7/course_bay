class EmailController < ApplicationController
	
	def send_email
		NoticeMailer.send_email(params[:email],params[:subject]).deliver
		respond_to do |format|
	        format.html { redirect_to authenticated_root_path, notice: 'Email was successfully sent.' }
	        # format.json { render :show, status: :created, location: @image }
	    end
	end
end
