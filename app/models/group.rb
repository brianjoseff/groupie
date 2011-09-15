class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members,    :through => :memberships, :source => :member, :foreign_key => :member_id
  belongs_to :owner,    :class_name => "User", :foreign_key => :user_id
  
  has_many :assignments
  has_many :posts,      :through => :assignments
  scope :public, where("private = ?", false)
  
  has_attached_file :photo, :styles => { :thumb => "100x100",
                                         :small => "200x200" },
                    :path => ":rails_root/public/system/photos/:id/:style/:basename.:extension",
                    :default_url => "/system/photos/missing/:style.png"
                    


end
