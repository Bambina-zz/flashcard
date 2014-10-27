class UsersController < ApplicationController
  layout 'session'
  # GET /users
  # GET /users.json
  def index
    if current_user.admin == false
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
    else
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if current_user == @user || current_user.admin == true
      respond_to do |format|
        format.html { render layout: 'application' }
        format.json { render json: @user }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @sub_title = 'Edit Profile'
    @sub_title2 = @user.name

    if current_user == @user || current_user.admin == true
      respond_to do |format|
        format.html { render layout: 'application' }
        format.json { render json: @user }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        login(@user.email, params[:user][:password], true)
        format.html { redirect_to root_path, :notice => "You are registered now!" }
        #format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if current_user == @user || current_user.admin == true
      respond_to do |format|
        if @user.update_attributes(params[:user])
          flash[:notice] = 'User was successfully updated.'
          @sub_title = 'Edit Profile'
          @sub_title2 = @user.name
          format.html { redirect_to :back }
          format.json { head :no_content }
        else
          format.html { render layout: 'application', action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if current_user == @user || current_user.admin == true
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
    end
  end
end
