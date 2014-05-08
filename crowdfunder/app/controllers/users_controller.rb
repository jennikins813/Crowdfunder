class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new user_parameters
  	if @user.save
  		auto_login(@user)
  		redirect_to project_url, :notice => "Signed Up!"
  	else
  		render :new
  	end
  end

  private
  def user_parameters
  	params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
  end
end
