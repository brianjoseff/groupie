class InviteMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def invite(name, to_address, from_address, group)
    @group = group
    mail(:to => to_address, :subject => "groupie | join this group, from #{name}", :reply_to => from_address)
  end
end
