class User < ActiveRecord::Base
  include Clearance::User
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+(edu)+\z/i
  
  validates :name,     :presence     => true,                       
                       :length       => { :maximum => 50 }          
  validates :email,    :presence     => true,                       
                       :format       => { :with => email_regex },   
                       :uniqueness   => { :case_sensitive => false }
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
                       
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :memberships, :dependent => :destroy, :foreign_key => :member_id
  has_many :groups_as_member, :through => :memberships, :source => :group, :class_name => "Group"
  has_many :groups_as_owner, :class_name => "Group"
  has_many :posts
  
  def join!(group)
    memberships.create!(:group_id => group.id)
  end
end
