require 'spec_helper'

RSpec.describe UsersController, :type => :controller do
	describe 'Admin user access' do
		before :each do
			@user1 = create(:user, :admin)
			@user2 = create(:user)
			login_user(@user1)
		end

		describe 'GET /users' do
			it 'renders the :index template' do
				get :index
				expect( response ).to render_template :index
			end

			it 'assigns all users to @users' do
				get :index
				num_expected = User.all.count
				expect( assigns(:users).count ).to eq num_expected
			end
		end

		describe 'GET #new' do
			it 'renders the :new template' do
				get :new
				expect( response ).to render_template :new
			end
		end

		describe 'POST #create' do
			it 'saves a new user in the database' do
				expect{
					post :create,
					user_name: 'name',
					user_email: '1234@example.com',
					user_password: 'password1234',
					user_password_confirmation: 'password1234'
				}.to change(User, :count).by 1
			end
		end

		describe 'GET #edit' do
			it 'assigns the requested user to @user' do
				get :edit, id: @user2.id
				expect( assigns(:user) ).to eq @user2
			end
		end

		describe 'PUT #update' do
			before(:each) do
				request.env["HTTP_REFERER"] = "http://test.host/#{Rails.root}/users/#{@user2.id}/edit"
			end
			it "changes @user2's name and email" do
				new_name  = 'new name'
				new_email = 'new_email@example.com'
				put :update,
				id: @user2,
				user: attributes_for(:user,
									 name: new_name,
									 email: new_email)
				@user2.reload
				expect(@user2.name).to eq new_name
				expect(@user2.email).to eq new_email
			end
			it 'redirects to the updated user' do
				put :update, id: @user2, user: attributes_for(:user)
				expect(response).to redirect_to :back
			end
		end

		describe 'DELETE #destroy' do
			it 'deletes the user' do
				expect{
					delete :destroy,
					id: @user2
				}.to change(User, :count).by -1
			end
			it "redirects user's index" do
				delete :destroy,
				id: @user2
				expect(response).to redirect_to users_path
			end
		end
	end

	describe 'User access' do
		before :each do
			@user1 = create(:user)
			@user2 = create(:user)
			login_user(@user1)
		end

		describe 'GET #index' do
			it 'redirects top page' do
				get :index
				expect(response).to redirect_to '/'
			end
		end

		describe 'GET #new' do
			it 'renders the :new template' do
				get :new
				expect(response).to render_template :new
			end
		end

		describe 'POST #create' do
			it 'sends welcome email' do
				post :create,
				user: attributes_for(:user)
				expected_email = User.last[:email]
				expected_name = User.last[:name]
				expect(open_last_email).to be_delivered_to expected_email
				expect(open_last_email).to have_body_text expected_name
			end
		end

		describe 'GET #edit' do
			it 'assigns current user to @user' do
				get :edit, id: @user1
				expect( assigns(:user) ).to eq @user1
			end
			it 'renders the :edit template' do
				get :edit, id: @user1
				expect( response ).to render_template :edit
			end
			it 'redirects to top when it requires another user' do
				get :edit, id: @user2
				expect( response ).to redirect_to '/'
			end
		end

		describe 'PUT #update' do
			before(:each) do
				request.env["HTTP_REFERER"] = "http://test.host/#{Rails.root}/users/#{@user1.id}/edit"
			end
			it "changes @user1's attributes" do
				new_name = 'new name'
				new_email = 'newemail@example.com'
				put :update,
				id: @user1,
				user: attributes_for(:user, name: new_name, email: new_email)
				@user1.reload
				expect(@user1.name).to eq new_name
				expect(@user1.email).to eq new_email
			end
			it 'redirects to top when it requires another user' do
				put :update, id: @user2, user: attributes_for(:user)
				expect(response).to redirect_to '/'
			end
		end

		describe 'DELETE #destroy' do
			it 'deletes the user' do
					expect{
						delete :destroy,
						id: @user1
					}.to change(User, :count).by -1
			end
			it "doesn't delete another user" do
				delete :destroy,
				id: @user2
				expect(response).to redirect_to '/'
			end
		end
	end	
end