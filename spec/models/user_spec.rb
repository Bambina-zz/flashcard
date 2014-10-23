require 'spec_helper'

RSpec.describe User, :type => :model do
	it { should have_attached_file(:avatar) }
	it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/jpg').
                rejecting('text/plain', 'text/xml') }
	it { should validate_attachment_size(:avatar).
                less_than(2.megabytes) }

	it 'is valid with a name, email, password and password confirmation' do
		expect( build(:user) ).to be_valid
	end

	it 'is invalid without a name' do
		user = build(:user, name: nil)
		expect( user ).to validate_presence_of(:name)
	end

	it 'is invalid without an email' do
		user = build(:user, email: nil)
		expect( user ).to validate_presence_of(:email)
	end

	it 'is invalid without a password' do
		user = build(:user, password: nil)
		expect( user ).to validate_presence_of(:password)
	end

	it 'is invalid with a duplicate email addres' do
		user = create(:user)
		other_user = build(:user, email: user.email)
		expect( other_user ).to validate_uniqueness_of(:email)
	end

	it 'is invalid with empty password_confirmation' do
		user = build(:user, password_confirmation: nil)
		expect( user ).to validate_presence_of(:password_confirmation)
	end

	it 'is invalid when password and password_confirmation are not equal' do
		user = build(
			:user,
			password:              '12345asdfg',
			password_confirmation: 'asdfg12345')
		expect( user ).to be_invalid
	end
end
