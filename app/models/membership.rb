class Membership < ActiveRecord::Base
  attr_accessible :member_id, :group_id
  
  belongs_to :member, :class_name => "User"
  belongs_to :group
end
