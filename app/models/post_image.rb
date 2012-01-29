class PostImage < ActiveRecord::Base
  # attr_accessible :imageable_id, :imageable_type, :post_image_ids
  belongs_to :imageable, :polymorphic => true
  has_attached_file :image, {:styles => { :medium => "200x200>", :thumb => "50x50>" }}.merge(PAPERCLIP_OPS)# ,
  #                             :storage => :s3,
  #                             :s3_credentials => S3_CREDENTIALS,
  #                             :path => "/:class/:style/:id/:filename"
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  
end
