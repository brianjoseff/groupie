class Post < ActiveRecord::Base
  belongs_to :user
  has_many :assignments, :dependent => :destroy
  has_many :groups, :through => :assignments
  has_attached_file :image, :styles => { :thumb => "100x100",
                                         :small => "200x200" },
                            :path => ":rails_root/public/system/images/posts/:id/:style/:basename.:extension"
end
