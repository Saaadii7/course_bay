class PaymentMethodsController < ApplicationController


  def show

  end

  def edit
    @paymentmethod = PaymentMethod.find(params[:id])
  end

  def destroy
    @paymentmethod = PaymentMethod.find(params[:id])
    if @paymentmethod.present?
      @paymentmethod.destroy
    end
    redirect_to payment_method_path
  end

  def update
    @paymentmethod = PaymentMethod.find(params[:id])
    @paymentmethod.update(payment_params)
			flash[:success] = "Category is successfully updated"
			redirect_to payment_method_path
  end

  def index
    @paymentmethods = PaymentMethod.all
  end

  def new
    @paymentmethod = PaymentMethod.new
  end
  
  def create
    @paymentmethod = PaymentMethod.new(payment_params)
    	# @article.user= current_user
    	if @paymentmethod.save
    	    redirect_to new_payment_method_path(@paymentmethod)
    	else
    		render 'new'
    	end
  end

  def payment_params
    	params.require(:payment_method).permit(:name)
  end
end
