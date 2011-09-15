class GroupMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def weekly_newsletter(user)
    @user = user
    #attachments[""]
    mail(:to => user.email, :subject => "cool stuff")
  end
end
