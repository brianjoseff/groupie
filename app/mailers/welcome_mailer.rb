class WelcomeMailer < ActionMailer::Base
  def welcome_mail(user)
    @user = user
    mail(:to => user.email, :subject => "welcome to ")
  end
end