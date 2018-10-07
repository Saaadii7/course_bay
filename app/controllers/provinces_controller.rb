class ProvincesController < ApplicationController


  def show

  end

  def edit
    @province = Province.find(params[:id])
  end

  def destroy
    @province = Province.find(params[:id])
    if @province.present?
      @province.destroy
    end
    redirect_to province_path
  end

  def update
    @province = Province.find(params[:id])
    @Province.update(province_params)
			flash[:success] = "Province is successfully updated"
			redirect_to provinces_path
  end

  def index
    @provinces = Province.all
  end

  def new
    @province = Province.new
  end

  def create
    @province = Province.new(province_params)
    	if @province.save
    		flash[:success] = "Province is successfully created"
    	    redirect_to new_province_path(@provinces)
    	else
    		render 'new'
    	end
  end

  def province_params
    	params.require(:province).permit(:province_name)
  end
end
