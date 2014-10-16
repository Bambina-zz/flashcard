require 'spec_helper'

feature 'Word management' do
	scenario 'login user adds a new word' do
		visit root_path

		expect(page).to have_content 'Create an account'
		click_link 'Create an account'
		fill_in 'user_name', with: 'mayuko'
		fill_in 'user_email', with: 'example123@example.com'
		fill_in 'user_password', with: 'password123'
		fill_in 'user_password_confirmation', with: 'password123'
		find('input#create_user').click

		click_link 'Add a New Word'
		fill_in 'word_name', with: 'bite'
		select 'Noun', from: 'word_word_type'
		fill_in 'word_sentences_attributes_0_content', with: 'Shall we grab a bite?'
		find('input#create_word').click

		click_link 'Vocabulary Gallery'
		expect(page).to have_content 'bite'
		expect(page).to have_content 'Noun'
		expect(page).to have_content 'Shall we grab a bite?'
	end
end
