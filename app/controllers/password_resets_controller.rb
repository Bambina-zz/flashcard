class PasswordResetsController < ApplicationController
  skip_before_filter :require_login
  layout 'session'

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { head :no_content }
    end
  end

  def create 
    @user = User.find_by_email(params[:email])

    if @user
	    @user.deliver_reset_password_instructions!
      flash.now[:success] = 'Instructions have been sent to your email.'
	    redirect_to login_path
    else
	    flash.now[:alert] = 'Sorry, something went wrong..make sure email address is correct.'
	    render 'new'
  	end
  end

  # This is the reset password form.
  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end

  # This action fires when the user has sent the reset password form.
  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.change_password!(params[:user][:password])
      login(@user.email, params[:user][:password], true)
      flash.now[:success] = 'Password was successfully updated.'
      redirect_to root_path
    else
      render :action => "edit"
    end
  end
end