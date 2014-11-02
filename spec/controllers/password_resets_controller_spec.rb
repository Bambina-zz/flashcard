require 'spec_helper'

RSpec.describe PasswordResetsController, :type => :controller do
  before :each do
    @user1 = create(:user)
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "redirects to login_oath" do
      get :edit, id: @user1
      expect(response).to redirect_to login_path
    end
  end

  describe "PATCH update" do
    it "redirects to login_oath" do
      patch :update, id: @user1
      expect(response).to redirect_to login_path
    end
  end
end
