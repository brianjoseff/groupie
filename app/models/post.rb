class Post < ActiveRecord::Base
  has_many :images
  belongs_to :user
  has_many :assignments, :dependent => :destroy
  has_many :groups, :through => :assignments
  has_attached_file :image, :styles => { :thumb => "100x100",
                                         :small => "200x200" },
                            :path => ":rails_root/public/system/images/:id/:style/:basename.:extension",
                            :default_url => ":rails_root/public/system/images/missing/:style.png"

end
