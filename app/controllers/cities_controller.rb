class CitiesController < ApplicationController


  def show

  end

  def edit
    @city = City.find(params[:id])
  end

  def destroy
    @city = City.find(params[:id])
    if @city.present?
      @city.destroy
    end
    redirect_to cities_path
  end

  def update
    @city = City.find(params[:id])
    @city.update(city_params)
    flash[:success] = "Category is successfully updated"
    redirect_to cities_path
  end

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      flash[:success] = "Category is successfully created"
      redirect_to new_city_path(@cities)
    else
      render 'new'
    end
  end

  def city_params
   params.require(:city).permit(:city_name, :province_id)
 end
end
