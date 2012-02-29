# == Schema Information
#
# Table name: memberships
#
#  id         :integer         not null, primary key
#  member_id  :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Membership < ActiveRecord::Base
  attr_accessible :member_id, :group_id
  
  belongs_to :member, :class_name => "User"
  belongs_to :group
  
  validates_uniqueness_of :member_id, :scope => :group_id
  
end
