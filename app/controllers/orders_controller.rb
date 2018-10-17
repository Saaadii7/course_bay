class OrdersController < ApplicationController


  def show

  end

  def edit
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.present?
      @order.order_items.each do |item|
        if item.post.isSimple?
          item.post.quantity = item.post.quantity + item.quantity
          item.post.save
        end
      end
      @order.order_items.destroy_all
      @order.destroy
    end
    redirect_to order_path
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status:"confirm" )
		redirect_to orders_path
  end



  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  
  def create
   #loop on shopping cart and check 1 must shopping cart quantity must less then shopping_cart.post.quantity
   
    @order = Order.new(user_id:params[:user_id], address_id:params[:address_id], cart_id:params[:cart_id], payment_method_id:params[:payment_method_id], status:"processing")
    	if @order.save
        current_user.cart.shopping_carts.each do |shopping_cart|
          OrderItem.create(order_id:@order.id, post_id:shopping_cart.post_id, quantity:shopping_cart.quantity)
        end
        current_user.cart.shopping_carts.destroy_all
    	    redirect_to home_path
    	else
    		render 'new'
    	end
  end

  def buy_auction_product
    user = current_user
    pay_method = PaymentMethod.find_by_name "Cash On Delivery"
    address = Address.find(params[:address_id])
    cart = Cart.find_or_create_by(user_id: current_user.id)
    post=Post.auction_posts.find(params[:post_id])
    if post.status == true 
      @order = Order.new(user_id:user.id, address_id:user.address.id, cart_id:cart.id, payment_method_id: pay_method.id, status:"processing")
      if @order.save
          OrderItem.create(order_id:@order.id, post_id:params[:post_id], quantity: 1)
          #do available false of post_id in params
          post.status= false
          post.save
          redirect_to home_path
      else
          render 'new'
      end
    end 
  end
end
