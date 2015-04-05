class SessionsController < ApplicationController
  layout 'session'
  force_ssl unless Rails.env.development?

  def new
    verified_request?
    @user = User.new
  end

  def create
    user = login(params[:sessionemail], params[:sessionpassword], params[:remember_me])
    if user
      flash[:notice] = 'Logged in!'
      redirect_back_or_to root_url
    else
      flash.now[:alert] = 'Email or password was invalid'
      render :new
    end
  end

  def destroy
    logout
    flash.now[:notice] = 'Logged out!'
    redirect_to root_url
  end
end
