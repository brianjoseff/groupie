class User < ActiveRecord::Base
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
  
  def get_random_items
    return "joe" unless member_groups == true
    if member_groups == 1
      assignments = member_groups.assignments.limit(5)
      random_items = Post.rand_by_post(assignments)
    end
    random_groups = member_groups.sort_by{rand}.slice(0,5)
    random_items = Array.new
    i=0
    return "bob" unless random_groups.empty? == true
    until i == 10 do
      random_groups.each do |group|
        assignments = group.assignments.limit(5)
        if y = Post.rand_by_post(assignments)
          random_items << y
          i+=1
          if random_items == 5
            return random_items
          end
        else
          return random_items
        end
      end
    end
    
    return random_items
  end
  
  def get_some_random_items(groups)
    random_items = Array.new
    return nil unless groups.empty? == false
    groups.each do |group|
      x = Post.rand_by_post(group.assignments)
      random_items << x
      if random_items.size == 5
        return random_items
      end
    end
    return random_items
  end
      
    
  
private
  def has_image?
     !self.avatar.url.include? "missing"
  end
  
end
