require 'spec_helper'

RSpec.describe UserMailer, :type => :mailer do
  describe 'welcome email' do
    before :each do
      @user = create :user
      @welcome_email = UserMailer.welcome_email(@user)
    end

    it 'sends to correct email addres' do
      expect(@welcome_email).to be_delivered_to @user.email
    end

    it 'has corect subject' do
      expect(@welcome_email).to have_subject 'Welcome to Flashcar-d'
    end

    it 'contains login url' do
      expect(@welcome_email).to have_body_text "#{login_path}"
    end
  end

  describe "reset_password_email" do
    let(:user) { create :user, reset_password_token: 'reset_password_token' }
    let(:mail) { UserMailer.reset_password_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your password has been reset")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["app22461025@heroku.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
