class AddressesController < ActionController::Base
  def update
  	byebug
  	@address = Address.find(params[:id])
    @address.update(address_params)
  	redirect_to profile_url
  end

  def show
  	
  end

 def create
    @address = Address.new(address_params)
    @address.user= current_user
    if @address.save
       redirect_to profile_url
    end
  end

  def address_params
      	params.require(:address).permit(:province, :city, :address, :postal_code)
    end
end