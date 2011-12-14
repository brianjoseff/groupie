class MessageMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def message_me(content, name, to_address, from_address)
    @content = content
    mail(:to => to_address, :subject => "groupie | from #{name}", :reply_to => from_address)
  end
end
