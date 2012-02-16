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
