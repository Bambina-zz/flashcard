require 'spec_helper'

feature 'User management' do

	scenario 'creates an account' do
		visit root_path
		expect(page).to have_content 'Create an account'
		expect{
			click_link 'Create an account'
			fill_in 'user_name', with: 'mayuko'
			fill_in 'user_email', with: 'example@gmail.com'
			fill_in 'user_password', with: 'password123'
			fill_in 'user_password_confirmation', with: 'password123'
			find('input#create_user').click
		}.to change(User, :count).by(1)

		expect(current_path).to eq root_path

		within 'aside' do
			expect(page).to have_content 'mayuko'
		end
	end
end