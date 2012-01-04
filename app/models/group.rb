class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members,    :through => :memberships, :source => :member, :foreign_key => :member_id
  belongs_to :owner,    :class_name => "User", :foreign_key => :user_id
  
  has_many :assignments
  has_many :posts,      :through => :assignments
  scope :public, where("private = ?", false)
  searchable do
    text :name, :description
  end
  
  has_attached_file :photo, :styles => { :thumb => "100x100",
                                         :small => "200x200" },
                    :path => ":rails_root/assets/images/post_images/:id/:style/:basename.:extension",
                    :default_url => "/assets/missing/:style.png"
                    
  
  def get_random
#    assignments = assignments.limit(5)
#    return Post.rand_by_post(assignments)
#    member_groups.sort_by{rand}.slice(0,5)
    assignments.sort_by{rand}.slice(0,5)
  end
end
