# == Schema Information
#
# Table name: post_images
#
#  id                 :integer         not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  imageable_id       :integer
#  imageable_type     :string(255)
#

class PostImage < ActiveRecord::Base
  # attr_accessible :imageable_id, :imageable_type, :post_image_ids
  belongs_to :imageable, :polymorphic => true
  #.merge(PAPERCLIP_OPS)
  has_attached_file :image, :styles => { :small => "100 x100>",:medium => "200x200>", :thumb => "50x50>" },
                            :storage => :s3, 
                            :s3_credentials => "#{Rails.root}/config/s3.yml", 
                            :path => "/:attachment/:id/:style/:filename"
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
end
