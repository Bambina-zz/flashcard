require 'spec_helper'

describe User do
  it 'is valid with a name, email, password and password confirmation' do
  	user = User.new(
  		name: 'Mayuko Hirono',
  		email: 'mayuko.hirono@gmail.com',
  		password: '12345asdfg',
  		password_confirmation: '12345asdfg')
  	expect( user ).to be_valid
  end

  it 'is invalid without a name' do
  	expect( User.new(name: nil) ).to have(1).errors_on(:name)
  end

  it 'is invalid without an email' do
  	expect( User.new(email: nil) ).to have(1).errors_on(:email)
  end

  it 'is invalid without a password' do
  	expect( User.new(password: nil) ).to have(1).errors_on(:password)
  end

  it 'is invalid with a duplicate email addres' do
  	User.create(
  		name: 'Mayuko Hirono',
  		email: 'mayuko.hirono@gmail.com',
  		password: '12345asdfg',
  		password_confirmation: '12345asdfg')
  	expect( User.new(email: 'mayuko.hirono@gmail.com') ).to have(1).errors_on(:email)
  end

  it 'is invalid with empty password_confirmation' do
  	expect( User.new(password_confirmation: nil) ).to have(1).errors_on(:password_confirmation)
  end

  it 'is invalid when password and password_confirmation are not equal' do
  	user = User.new(
  		name: 'Mayuko Hirono',
  		email: 'mayuko.hirono@gmail.com',
  		password: '12345asdfg',
  		password_confirmation: 'asdfg12345')
  	expect( user ).to be_invalid
  end
end
