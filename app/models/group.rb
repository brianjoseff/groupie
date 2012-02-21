class Group < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :post_images, :as => :imageable, :dependent => :destroy
  has_many :memberships
  has_many :members,    :through => :memberships, :source => :member, :foreign_key => :member_id
  belongs_to :owner,    :class_name => "User", :foreign_key => :user_id
  has_many :assignments
  has_many :posts,      :through => :assignments
  #scope :public, where("private = ?", false)
  
  accepts_nested_attributes_for :post_images
  
  def get_random
#    assignments = assignments.limit(5)
#    return Post.rand_by_post(assignments)
#    member_groups.sort_by{rand}.slice(0,5)
    assignments.sort_by{rand}.slice(0,5)
  end
  
  class << self
    #the method that checks the password supplied by prospective members
    def check(code, group_id)
      group = find_by_id(group_id)
      group.group_password == code ? group : nil
    end
  end
end
