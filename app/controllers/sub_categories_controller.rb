class SubCategoriesController < ApplicationController

  def create
    @subcategory = SubCategory.new(subcategory_params)
    	# @article.user= current_user
    	if @subcategory.save
        if params[:sub_category][:category_ids]
          params[:sub_category][:category_ids].each do |catId|
            if catId != ''
              @cat = Category.find_by_id catId
              @subcategory.categories << @cat
            end
          end
        end
    		flash[:success] = "Category is successfully created"
    	    redirect_to new_sub_category_path(@subcategories)
    	else
    		render 'new'
    	end
  end

  def show

  end

  def edit
    @subcategory = SubCategory.find(params[:id])
  end

  def update
    @subcategory = SubCategory.find(params[:id])
    @subcategory.update(subcategory_params)
			flash[:success] = "SubCategory is successfully updated"
			redirect_to sub_categories_path
  end

  def destroy
    @subcategory = SubCategory.find(params[:id])
    if @subcategory.present?
      @subcategory.destroy
      redirect_to sub_categories_path
    end
  end

  def index
    @subcategories = SubCategory.all
  end

  def new
    @subcategory = SubCategory.new
  end
  def subcategory_params
    	params.require(:sub_category).permit(:name, :category_id)
  end

end
