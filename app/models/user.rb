class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :last_4_digits
    
  include Clearance::User
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+(edu)+\z/i
  
  validates :name,     :presence     => true,                       
                       :length       => { :maximum => 50 }          
                       
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "50x50>" },
                             :default_url => "/system/avatars/missing/:style.png",
                             :path => ":rails_root/public/system/avatars/:id/:style/:basename.:extension"
  has_many :memberships, :dependent => :destroy, :foreign_key => :member_id
  has_many :groups_as_member, :through => :memberships, :source => :group, :class_name => "Group", :foreign_key => :user_id
  has_many :groups_as_owner, :class_name => "Group"
  has_many :posts
  accepts_nested_attributes_for :posts  
  before_update :update_stripe
  attr_accessor :stripe_customer_token
  
  def get_randos(groups)
    if groups == nil
      return nil
    end
    all_items = Array.new
    groups.each do |group|
      all_items.concat(group.posts)
    end
    x = all_items.sort_by{rand}.slice(0,5)
    if x.empty?
      return nil
    else
      return x
    end
  end

  def update_stripe
    if stripe_customer_token.present?
      if stripe_id.nil?
        customer = Stripe::Customer.create(
          :description => email,
          :card => stripe_card_token
        )
#         self.last_4_digits = customer.active_card.last4
#         response = customer.update_subscription({:plan => "premium"})
      else
        customer = Stripe::Customer.retrieve(stripe_id)
        customer.card = stripe_customer_token
        customer.save
#         self.last_4_digits = customer.active_card.last4
      end

      self.stripe_id = customer.id
      self.stripe_customer_token = nil
#     elsif last_4_digits_changed?
#       self.last_4_digits = last_4_digits_was
#     end
    end
  end
  
  def payment(user)
    if valid?
      customer = Stripe::Customer.retrieve(user.stripe_id)
      Stripe::Charge.create(:amount => 500, :currency => "usd", :customer => customer.id)
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
    
  
private
  def has_image?
     !self.avatar.url.include? "missing"
  end
  
end
