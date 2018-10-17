class BidsController < ApplicationController


  def show

  end
  def destroy
    @bid = Bid.find(params[:bid_id])
    if @bid.present?
      @bid.destroy
    end
    redirect_to post_path()
  end

  def index
    @bids = Bid.all
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid= Bid.new(user_id: params[:user_id], post_id: params[:post_id], price: params[:price])
    @post = Post.find(params[:post_id])
    if @bid.price > @post.starting_bid
      @bid.save
    end
  		redirect_to  post_path(@post)
  end
end
