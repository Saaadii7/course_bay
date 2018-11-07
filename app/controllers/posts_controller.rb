class PostsController < ApplicationController

before_action :require_addrress, only:[:show]

    def create
        @post = Post.new(posts_params)
        @post.user= current_user
        if @post.type && @post.type.name == "New"
        end
        if @post.save
            redirect_to posts_path
        else

        end
    end

    def new
      @post=current_user.posts.build
      @sub_categories = SubCategory.all
    end

    def show
        @post = Post.find(params[:id])
        @total_bids = @post.bids.sort_by(&:created_at)
        @bids = @post.bids.where(user_id: current_user.id).sort_by(&:created_at)
        @paymentmethod = PaymentMethod.all
          @orders= Order.all
          @provinces = Province.all
          @cities = City.all
          @cart = Cart.all
          @user = current_user
          if current_user.address
            @address = current_user.address
          else
            @address = current_user.build_address
        end
    end

    def update
        @post = Post.find(params[:id])
        @post.update(posts_params)
  			redirect_to posts_path
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
      @post= Post.find(params[:id])
      if @post.present?
        @post.destroy
      end
      redirect_to posts_path
    end

    def index
      @posts = Post.all
    end

    def posts_params
      	params.require(:post).permit(:name, :description, :price, :photo, :ptype, :brand_id, :category_id, :sub_category_id, :starting_bid, :start_datetime, :end_datetime, :quantity, :percentage_off)
    end

    def require_addrress
      user = current_user
      if user 
        if user.address.present?
        else
          redirect_to profile_path
        end
      else
        redirect_to new_user_session_path
      end
    end
end
