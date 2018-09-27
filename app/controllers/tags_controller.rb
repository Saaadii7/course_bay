class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    # @article.user= current_user
    if @tag.save
      if params[:tag][:sub_category_ids]
        params[:tag][:sub_category_ids].each do |subcatId|
          @subcat = SubCategory.find_by_id subcatId
          @tag.sub_categories << @subcat
        end
      end
      if params[:tag][:category_ids]
        params[:tag][:category_ids].each do |catId|
          @cat = Category.find_by_id catId
          @tag.categories << @cat
        end
      end
      if params[:tag][:brand_ids]
        params[:tag][:brand_ids].each do |brandId|
          @brand = Brand.find_by_id brandId
          @tag.brands << @brand
        end
      end
      flash[:success] = "Category is successfully created"
      redirect_to new_tag_path(@subcategories)
    else
      render 'new'
    end
  end

  def show

  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    flash[:success] = "SubCategory is successfully updated"
    redirect_to tags_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.present?
      @tag.destroy
      redirect_to tags_path
    end
  end

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end
  def tag_params
    params.require(:tag).permit(:name, :sub_category_id)
  end

end
