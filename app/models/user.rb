class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :stripe_token, :last_4_digits
    
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
  
#  before_save :update_stripe
  attr_accessor :stripe_card_token
  
  def update_stripe
    if stripe_token.present?
      if stripe_id.nil?
        customer = Stripe::Customer.create(
          :description => email,
          :card => stripe_token
        )
        self.last_4_digits = customer.active_card.last4
        response = customer.update_subscription({:plan => "premium"})
      else
        customer = Stripe::Customer.retrieve(stripe_id)
        customer.card = stripe_token
        customer.save
        self.last_4_digits = customer.active_card.last4
      end

      self.stripe_id = customer.id
      self.stripe_token = nil
    elsif last_4_digits_changed?
      self.last_4_digits = last_4_digits_was
    end
  end

#   def get_some_random_items(groups)
#     random_items = Array.new
#     return nil unless groups.empty? == false
#     groups.each do |group|
#       group_posts = Post.find(:all, :conditions => ['group_id = ? ', group.id], :joins => [:assignments])
#       x = group_posts.sample
#       if x.nil?
#         return
#       end
#       random_items << x
#       if random_items.size == 5
#         return random_items
#       end
#     end
#     return random_items
#   end
  
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
#  def get_some_random_items(groups)
#    random_items = Array.new
#    group_posts = Post.find(:all, :conditions => ['group.id = ? ', group.id], :joins => [:assignments])
#    return nil unless groups.empty? == false
#    while random_items.length < 5 do
#      x = groups.sample
#      if x != nil
#        z = x.get_random
#        y = Post.find(z.id)
#        if y.nil?
#          return
#        end
##      end
#      random_items << y
#      if random_items.size == 5
#        return random_items
#      end
#    end
#    return random_items
#  end
      
    
  
private
  def has_image?
     !self.avatar.url.include? "missing"
  end
  
end
