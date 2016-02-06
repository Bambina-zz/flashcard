require 'spec_helper'

RSpec.describe User, :type => :model do
	it { should have_attached_file(:avatar) }
	it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/jpg').
                rejecting('text/plain', 'text/xml') }
	it { should validate_attachment_size(:avatar).
                less_than(2.megabytes) }

  describe 'validation' do
  	let(:user) { build(:user, params) }
		context 'with valid params' do
			let(:params) { nil }
			it { expect(user.valid?).to be_truthy }
		end

		context 'without name' do
			let(:params) { {name: nil} }
			it { expect(user.valid?).to be_falsy }
		end

		context 'without email' do
			let(:params) { {email: nil} }
			it { expect(user.valid?).to be_falsy }
		end

		context 'without password' do
			let(:params) { {password: nil} }
			it { expect(user.valid?).to be_falsy }
		end

		context 'without password_confirmation' do
			let(:params) { {password_confirmation: nil} }
			it { expect(user.valid?).to be_falsy }
		end

		context 'password_confirmation is not equal' do
			let(:params) { { password: 'password',
											 password_confirmation: 'confirmation' } }
			it { expect(user.valid?).to be_falsy }
		end

		context 'with a duplicate email' do
			let(:email) { 'dup@example.com' }
			let!(:exist_user) { create(:user, email: email) }

			let(:params) { {email: email} }
			it { expect(user.valid?).to be_falsy }
		end
  end
end
