class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
  	@user = user
  	@url = "#{::Rails.root}/login"
  	mail(to: @user.email, subject: 'Welcome to Flashcard')
  end
end
