class OrdersController < ApplicationController


  def show

  end

  def edit
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.present?
      @order.order_items.destroy_all
      @order.destroy
    end
    redirect_to profile_path
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
			flash[:success] = "Category is successfully updated"
			redirect_to profile_path
  end

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  
  def create
    @order = Order.new(user_id:params[:user_id], address_id:params[:address_id], cart_id:params[:cart_id], payment_method_id:params[:payment_method_id], status:"processing")
    	if @order.save
        current_user.cart.shopping_carts.each do |shopping_cart|
          OrderItem.create(order_id:@order.id, post_id:shopping_cart.post_id, quantity:shopping_cart.quantity)
        end
        current_user.cart.shopping_carts.destroy_all
    		flash[:success] = "Category is successfully created"
    	    redirect_to home_path
    	else
    		render 'new'
    	end
  end
end
