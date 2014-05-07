require 'spec_helper'

feature 'Word management' do
	scenario 'login user adds a word' do
		visit root_path
		click_link 'Create an account'
		fill_in 'user_name', with: 'mayuko'
		fill_in 'user_email', with: 'example@gmail.com'
		fill_in 'user_password', with: 'password123'
		fill_in 'user_password_confirmation', with: 'password123'
		find('input#create_user').click
		
		visit '/words'
		click_link 'New Word'
		expect{
			fill_in 'word_name', with: 'work'
			fill_in 'word_word_type', with: 'noun'
			fill_in 'word_sentences_attributes_0_content', with: 'I go to work.'
			find('input#create_word').click
		}.to change(Word, :count).by(1)
	end
end