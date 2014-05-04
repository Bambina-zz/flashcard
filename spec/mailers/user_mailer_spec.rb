require 'spec_helper'

describe UserMailer do
	describe 'welcome email' do
		before :each do
			@user = create :user
			@welcome_email = UserMailer.welcome_email(@user)
		end

		it 'sends to correct email addres' do
			expect(@welcome_email).to be_delivered_to @user.email
		end

		it 'has corect subject' do
			expect(@welcome_email).to have_subject 'Welcome to My Awesome Site'
		end

		it 'contains login url' do
			expect(@welcome_email).to have_body_text "#{login_path}"
		end
	end 
end

