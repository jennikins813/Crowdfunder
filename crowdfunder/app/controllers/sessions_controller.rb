class SessionsController < ApplicationController
  def new
    #@user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to projects_path, :notice => 'Logged in!'
    else
      flash.now.alert = 'Email or password was invalid'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => 'Logged out!'
  end
end