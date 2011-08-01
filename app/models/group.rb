class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  
  has_attached_file :photo, :styles => { :thumb => "100x100",
                                         :small => "200x200" },
                    :path => ":rails_root/public/system/:id/:extension"
  attr_accessible :photo, :photo_file_name, :photo_content_type,
                  :photo_file_size,  :photo_updated_at
end
