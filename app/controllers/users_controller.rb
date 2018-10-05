class UsersController < ActionController::Base
  def update
  	byebug
  	@user = User.find(params[:id])
    @user.update(user_params)
  	redirect_to profile_url
  end

  def show
  	
  end

  def user_params
      	params.require(:user).permit(:first_name, :last_name, :image, :email, :gender, :phone_number, :dob )
    end
end
