# == Schema Information
#
# Table name: users
#
#  id                    :integer         not null, primary key
#  email                 :string(255)
#  encrypted_password    :string(128)
#  salt                  :string(128)
#  confirmation_token    :string(128)
#  remember_token        :string(128)
#  created_at            :datetime
#  updated_at            :datetime
#  name                  :string(255)
#  zip                   :integer
#  school                :string(255)
#  avatar_file_name      :string(255)
#  avatar_content_type   :string(255)
#  avatar_file_size      :integer
#  avatar_updated_at     :datetime
#  admin                 :boolean         default(FALSE)
#  last_4_digits         :string(255)
#  stripe_id             :string(255)
#  subscribed            :boolean
#  stripe_customer_token :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :last_4_digits
    
  include Clearance::User
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+(edu)+\z/i
  
  validates_presence_of :name, :email, :password         
                       
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
  
  def self.weekly_update
    @users = User.all
    posts = Array.new
    @users.each do |user|
      @groups = user.groups_as_member
      @groups.each do |group|
        posts.concat(group.posts.where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week))
      end
      UserMailer.weekly_update(posts, user).deliver
    end
  end
  
private
  def has_image?
     !self.avatar.url.include? "missing"
  end
  
end
