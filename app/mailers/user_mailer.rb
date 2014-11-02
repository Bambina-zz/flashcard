class UserMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #

  def welcome_email(user)
    @user = user
    @url  = "#{root_url(only_path: false)}login"
    mail :subject => "Welcome to Flashcar-d",
         :to      => @user.email,
         :from    => "\"Flashcar-d\" <app22461025@heroku.com>"
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail :subject => "Your password has been reset",
         :to      => @user.email,
         :from    => "\"Flashcar-d\" <app22461025@heroku.com>"
  end
end
