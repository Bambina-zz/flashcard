require 'spec_helper'

describe User do
	it 'is valid with a name, email, password and password confirmation' do
		expect( build(:user) ).to be_valid
	end

	it 'is invalid without a name' do
		user = build(:user, name: nil)
		expect( user ).to have(1).errors_on(:name)
	end

	it 'is invalid without an email' do
		user = build(:user, email: nil)
		expect( user ).to have(1).errors_on(:email)
	end

	it 'is invalid without a password' do
		user = build(:user, password: nil)
		expect( user ).to have(2).errors_on(:password)
	end

	it 'is invalid with a duplicate email addres' do
		user = create(:user)
		other_user = build(:user, email: user.email)
		expect( other_user ).to have(1).errors_on(:email)
	end

	it 'is invalid with empty password_confirmation' do
		user = build(:user, password_confirmation: nil)
		expect( user ).to have(1).errors_on(:password_confirmation)
	end

	it 'is invalid when password and password_confirmation are not equal' do
		user = build(
			:user,
			password:							 '12345asdfg',
			password_confirmation: 'asdfg12345')
		expect( user ).to be_invalid
	end
end
