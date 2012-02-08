class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def welcome_mail(user)
    @user = user
    #attachments[""]
    mail(:to => user.email, :subject => "welcome to groupie")
  end
  
  def weekly_update(posts, user)
    @posts = posts
    @user = user
    mail(:to => user.email, :subject => "new posts")
  end
end
