class SessionsController < ApplicationController
  layout 'session'
  def new
    @user = User.new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      flash[:notice] = 'Logged in!'
      redirect_back_or_to root_url
    else
      flash[:alert] = 'Email or password was invalid'
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = 'Logged out!'
    redirect_to root_url
  end
end