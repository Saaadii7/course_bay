class CategoriesController < ApplicationController


  def show
    @category = Category.find(params[:id])

  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.present?
      @category.destroy
    end
    redirect_to categories_path
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
			flash[:success] = "Category is successfully updated"
			redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def get_sub_categories
     @category = Category.find_by_id(params[:id])
     @sub_categories = @category.sub_categories
     @brands = @category.brands
  end
  
  def create
    @category = Category.new(category_params)
    	# @article.user= current_user
    	if @category.save
    		flash[:success] = "Category is successfully created"
    	    redirect_to new_category_path(@categories)
    	else
    		render 'new'
    	end
  end

  def category_params
    	params.require(:category).permit(:name)
  end
end
