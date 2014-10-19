class UserMailer < ActionMailer::Base
  def welcome_email(user)
	@user = user
	@url = "#{root_url(only_path: false)}login"
	mail :subject => "Welcome to Flashcar-d",
         :to      => @user.email,
         :from    => "\"Flashcar-d\" <app22461025@heroku.com>"
  end
end
