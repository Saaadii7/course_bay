class PostsController < ApplicationController

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

end
