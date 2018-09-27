class TypesController < ApplicationController

  def new
    @type = Type.new
  end

  def update
    @type = Type.find(params[:id])
    @type.update(category_params)
			redirect_to types_path
  end

  def show

  end

  def create
      @type =Type.new(type_params)
      @type.save
    	  redirect_to new_type_path(@types)
  end

  def destroy
      @type = Type.find(params[:id])
      if @type.present?
          @type.destroy
      end
    redirect_to types_path
  end

  def edit
    @type = Type.find(params[:id])
  end

  def index
    @types = Type.all
  end

  def type_params
    	params.require(:type).permit(:name)
  end

end
