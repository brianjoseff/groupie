class Email < ActiveRecord::Base
  belongs_to :post
  
  def get_to_users_email(user)
    person = User.find_by_id(user)
    return person.email
  end
end
