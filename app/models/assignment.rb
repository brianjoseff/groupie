# == Schema Information
#
# Table name: assignments
#
#  id         :integer         not null, primary key
#  group_id   :integer
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Assignment < ActiveRecord::Base
  belongs_to :post
  belongs_to :group
  
  def get_assignment_post_id(assignments)
    return assignments.first(:order => "RANDOM()").post_id
  end
end
