require 'spec_helper'

describe Word do
	it 'is valid with name, user_id, word_type' do
		expect( FactoryGirl.build(:word) ).to be_valid
	end

	it 'is invalid without a name' do
		word = FactoryGirl.build(:word, name: nil)
		expect( word ).to have(1).errors_on(:name)
	end

	it 'is invalid without a word_type' do
		word = FactoryGirl.build(:word, word_type: nil)
		expect( word ).to have(1).errors_on(:word_type)
	end

	it 'is invalid without a user_id' do
		word = FactoryGirl.build(:word, user_id: nil)
		expect( word ).to have(1).errors_on(:user_id)
	end

	it 'does not allow duplicate word names per user' do
		user = User.create(
			name: 'Mayuko Hirono',
			email: 'mayuko.hirono@gmail.com',
			password: '12345asdfg',
			password_confirmation: '12345asdfg')
		user.words.create(
			name: 'work',
			word_type: 'noun')
		work_word = user.words.build(
			name: 'work',
			word_type: 'noun')
		expect( work_word ).to have(1).errors_on(:name)
	end

	it 'allows two users to have a same word' do
		user = User.create(
			name: 'Mayuko Hirono',
			email: 'mayuko.hirono@gmail.com',
			password: '12345asdfg',
			password_confirmation: '12345asdfg')
		user2 = User.create(
			name: 'Mayuko Hirono',
			email: '2mayuko.hirono@gmail.com',
			password: '12345asdfg',
			password_confirmation: '12345asdfg')
		user.words.create(
			name: 'work',
			word_type: 'noun')
		user2_word = user2.words.build(
			name: 'work',
			word_type: 'noun')

		expect( user2_word ).to be_valid
	end
end
