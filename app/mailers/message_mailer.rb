class MessageMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def message_me(content, to_address, from_address)
    @content = content
    mail(:to => to_address, :subject => "groupie | from a user", :reply_to => from_address)
  end
end
