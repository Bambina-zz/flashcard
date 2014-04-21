require 'spec_helper'

describe HomeController do
	shared_examples('public access to home') do
		describe 'GET #index' do
			it 'renders the :inedx template' do
				get :index
				expect( response ).to render_template :index
			end
		end
	end

	describe 'guest access' do
		it_behaves_like 'public access to home'
	end

	describe 'login user access' do
		before :each do
			@user = create(:user)
			login_user(@user)
		end

		it_behaves_like 'public access to home'
	end
end
