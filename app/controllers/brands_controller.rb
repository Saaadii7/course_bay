class BrandsController < ApplicationController

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
       if params[:brand][:category_ids]
          params[:brand][:category_ids].each do |catId|
            if catId != ''
              @cat = Category.find_by_id catId
              @brand.categories << @cat
            end
          end
        end
      redirect_to new_brand_path(@brands)
    end
  end

  def show
    @brand = Brand.find(params[:id])

  end

  def update
    @brand = Brand.find(params[:id])
    @brand.update(brand_params)
    redirect_to brands_path
  end

  def destroy
    @brand = Brand.find(params[:id])
    if @brand.present?
        @brand.destroy
        redirect_to brands_path
    end
  end

  def edit
      @brand = Brand.find(params[:id])
  end

  def new
    @brand= Brand.new
  end

  def index
    @brands = Brand.all
  end
  def brand_params
    	params.require(:brand).permit(:name, :photo)
  end

end
