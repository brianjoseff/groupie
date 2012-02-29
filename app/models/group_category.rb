# == Schema Information
#
# Table name: group_categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class GroupCategory < ActiveRecord::Base
  has_many :groups
  
end
