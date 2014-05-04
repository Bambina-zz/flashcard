require 'spec_helper'

describe UsersController do
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
end