class InterestMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def interest_email(post, email, to_address, from_address)
    @user = email.to
    @post = post
    @subject = email.subject
    @content = email.content
    #attachments[""]
    mail(:to => to_address, :subject => "groupie | #{@subject}", :reply_to => from_address)
  end
end
