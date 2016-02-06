require 'spec_helper'

RSpec.describe Word, :type => :model do
  describe 'validation' do
		let(:word) { build(:word, params) }

		context 'with valid params' do
			let(:params) { nil }
			it { expect(word.valid?).to be_truthy }
		end

		context 'without name' do
			let(:params) { {name: nil} }
			it { expect(word.valid?).to be_falsy }
		end

		context 'without word_type' do
			let(:params) { {word_type: nil} }
			it { expect(word.valid?).to be_falsy }
		end

		context 'without user_id' do
			let(:params) { {user_id: nil} }
			it { expect(word.valid?).to be_falsy }
		end
	end

  describe 'association with user model' do
		# TODO
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
		expect( work_word.valid? ).to be_falsy
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

		expect( user2_word.valid? ).to be_truthy
	end
end
