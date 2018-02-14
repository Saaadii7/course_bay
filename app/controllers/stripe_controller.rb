class StripeController < ApplicationController

	def card_pay
		require "stripe"
		@token = Stripe::Token.create(
			:card => {
			    :number => params[:card_number],
			    :exp_month => params[:expiry].to_datetime.month,
			    :exp_year => params[:expiry].to_datetime.year,
			    :cvc => params[:cvc]
			  }
			)
		@customer = Stripe::Charge.create(
		  :amount => 20*100,
		  :currency => "usd",
		  :source => @token, # obtained with Stripe.js
		  :description => "Charge for Saadi bhai"
		)
		Transaction.create(stripe_customer_id: @customer.id, user_id: current_user.id)
		respond_to do |format|
	        format.html { redirect_to authenticated_root_path, notice: 'Payment Successful.' }
	        # format.json { render :show, status: :created, location: @image }
	    end
	end

end
