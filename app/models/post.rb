class Post < ActiveRecord::Base
#   attr_accessible :name, :borrow, :price, :description, :user_id, :product_category_id, :post_image_ids, :group_ids, :post_images_attributes, :post_image
  has_many :post_images, :as => :imageable, :dependent => :destroy
  has_many :emails
  belongs_to :user
  belongs_to :product_category
  has_many :assignments, :dependent => :destroy
  has_many :groups, :through => :assignments
 
  accepts_nested_attributes_for :post_images#, :reject_if => lambda { |t| t[:post_image].nil?}, :allow_destroy => true
  accepts_nested_attributes_for :assignments, :allow_destroy => true
  accepts_nested_attributes_for :user
  attr_accessor :stripe_customer_token
 
  # sunspot/solr has been breaking things, so this is commented out
  # searchable do
  #     text :name, :description
  #   end
  
  # def post_images_attributes=(post_image_attributes)
  #     post_image_attributes.each do |attributes|
  #       post_images.build(attributes)
  #     end
  #   end
  
  def get_assignment_post_id(assignments)
    return assignments.first(:order => "RANDOM()").post_id
  end
end
