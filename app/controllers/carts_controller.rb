class CartsController < ActionController::Base
	
	def create
		 @cart = Cart.new(cart_params)
        @cart.user= current_user
        @cart.save
	end
	def add_products
		if current_user
			cart = Cart.find_or_create_by(user_id: current_user.id)
			shop = ShoppingCart.find_or_create_by(cart_id: cart.id,post_id: params[:post_id])
			shop.quantity = shop.quantity + params[:amount].to_i
			shop.save
			# flash[:success] = t('.successfully_created')
			# toastr.success('Product is seccessfully added to cart')
		else
      		redirect_to new_user_session_path
		end
	end

	def show
		@cart = Cart.find_or_create_by(user_id: current_user.id)
	end
	
	def update
        @cart = Cart.find(params[:id])
        @cart.update(cart_params)
  			redirect_to cart_path
    end

    def edit
        @cart = Cart.find(params[:id])
    end

    def destroy
      @cart= Cart.find(params[:id])
      # @cart.present?
      #   @post.destroy
      # end
      redirect_to posts_path
    end
	def cart_params
	     params.require(:cart).permit(:user_id, :quantity, :post_id )
	end

	def delete_products
		byebug
			ShoppingCart.find(params[:shopping_cart_id]).destroy
      		redirect_to checkout_path
	end

end
