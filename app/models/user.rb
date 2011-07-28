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
  
end
