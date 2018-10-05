class CartController < ActionController::Base

def update
end

def edit
end

def create
end

def show
end

def new
  	 # @cart=current_user.cart.build
end

def cart_params
     params.require(:cart).permit(:user_id )
end

end
