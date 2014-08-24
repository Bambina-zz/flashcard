require 'spec_helper'

feature 'Word management' do
	DatabaseCleaner.clean
	scenario 'login user adds 2 words and choose a category to see only adjectives', js:true do

		#TODO: doesn't work below
		# user = create(:user)
		# visit "/login"
		# fill_in "email",    with: user.email
		# fill_in "password", with: user.password
		# find('input#login_user').click

		visit root_path
		click_link 'Create an account'
		fill_in 'user_name', with: 'mayuko'
		fill_in 'user_email', with: 'example@example.com'
		fill_in 'user_password', with: 'password123'
		fill_in 'user_password_confirmation', with: 'password123'
		find('input#create_user').click

		visit '/words'
		click_link 'New Word'
		fill_in 'word_name', with: 'bite'
		fill_in 'word_word_type', with: 'noun'
		fill_in 'word_sentences_attributes_0_content', with: 'Shall we grab a bite?'
		find('input#create_word').click

		visit root_path
		expect(page).to have_content 'bite'
		expect(page).to have_content 'Noun'
		expect(page).to have_content 'Shall we grab a bite?'

		visit '/words'
		click_link 'New Word'
		fill_in 'word_name', with: 'exuberant'
		fill_in 'word_word_type', with: 'adjective'
		fill_in 'word_sentences_attributes_0_content', with: 'Alcohol make me exuberant.'
		find('input#create_word').click

		visit root_path
		click_link 'Adjective'
		expect(page).to have_content 'exuberant'
		expect(page).to_not have_content 'bite'
	end
end