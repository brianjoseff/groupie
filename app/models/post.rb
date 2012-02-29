# == Schema Information
#
# Table name: posts
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  borrow                 :boolean
#  price                  :integer
#  description            :text
#  created_at             :datetime
#  updated_at             :datetime
#  user_id                :integer
#  product_category_id    :integer
#  premium_mult_group_viz :boolean
#

class Post < ActiveRecord::Base
#   attr_accessible :name, :borrow, :price, :description, :user_id, :product_category_id, :post_image_ids, :group_ids, :post_images_attributes, :post_image
#   validates_presence_of :_destroy
#   validates_presence_of :name, :description
  
  has_many :post_images, :as => :imageable, :dependent => :destroy
  has_many :emails
  belongs_to :user
  belongs_to :product_category
  has_many :assignments, :dependent => :destroy
  has_many :groups, :through => :assignments
#   scope :published, lambda{ where("published_on >= ?", Time.now).where("deleted_on IS NULL or deleted_at < ?", Time.now)
  
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
  
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create( :description => email, :card => stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
  def payment(plan_id, weeks, doesnt_need_bin)
    if valid?
      customer = Stripe::Customer.retrieve(self.stripe_customer_token)     
      if plan_id == 1
        amount = doesnt_need_bin == false ? weeks*500+2800 : weeks*500
      elsif plan_id == 2
        amount = doesnt_need_bin == false ? weeks*800+2800 : weeks*800
      elsif plan_id == 3
        amount = weeks*800
      elsif plan_id == 4
        amount = weeks*1100
      end
      Stripe::Charge.create(:amount => amount, :currency => "usd", :customer => customer.id)
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
#   def self.deactivate_old
#     self.where("updated_at >= ?", time_ago_in_words(2.weeks)).destroy
#   end
end
