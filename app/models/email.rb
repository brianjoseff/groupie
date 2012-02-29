# == Schema Information
#
# Table name: emails
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  content    :text
#  to         :integer(255)
#  from       :integer(255)
#  created_at :datetime
#  updated_at :datetime
#  post_id    :integer
#

class Email < ActiveRecord::Base
  belongs_to :post
  
  def get_to_users_email(user)
    person = User.find_by_id(user)
    return person.email
  end
end
