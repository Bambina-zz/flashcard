require 'spec_helper'

describe Word do
	it 'is valid with name, user_id, word_type' do
		user = User.create(
  		name: 'Mayuko Hirono',
  		email: 'mayuko.hirono@gmail.com',
  		password: '12345asdfg',
  		password_confirmation: '12345asdfg')
		word = Word.new(
			name: 'work',
			user_id: user.id,
			word_type: 'noun')
		expect( word ).to be_valid
	end

	it 'is invalid without a name' do
		expect( Word.new(name: nil) ).to have(1).errors_on(:name)
	end

	it 'is invalid without a word_type' do
		expect( Word.new(word_type: nil) ).to have(1).errors_on(:word_type)
	end

	it 'is invalid without a user_id' do
		expect( Word.new(user_id: nil) ).to have(1).errors_on(:user_id)
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
		work_word = user2.words.build(
			name: 'work',
			word_type: 'noun')

		expect( work_word ).to be_valid
	end
end
