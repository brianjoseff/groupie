class Image < ActiveRecord::Base
  belongs_to :post
  #has_attached_file :asset, :styles => { :thumb => "100x100",
  #                                  :small => "200x200" },
  #                        :path => ":rails_root/public/system/images/posts/:id/:style/:basename.:extension"
  
end