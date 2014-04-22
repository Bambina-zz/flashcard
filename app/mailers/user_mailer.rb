class UserMailer < ActionMailer::Base
  default from: "app22461025@heroku.com"

  def welcome_email(user)
  	@user = user
  	@url = "#{root_url(only_path: false)}login"
  	mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
