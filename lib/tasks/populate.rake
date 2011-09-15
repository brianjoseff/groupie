namespace :db do
  desc "erase and fill database"
  task :populate => :environment do
    require 'faker'
    require 'forgery'
    
    [User, Group, Membership, Assignment, Post].each(&:delete_all)
    User.create!(:name => "Brian",
                 :email => "b@b.edu",
                 :password => "000000")
    
    #users
    15.times do |n|
      name = Faker::Name.name
      email = Faker::Name.first_name + '@' + Forgery(:LoremIpsum).word(:random => true) + '.edu'
      password = Forgery(:basic).password
      zip = Forgery(:address).zip
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password => password,
                   :zip => zip)
    end
    
    #group data
    10.times do |y|
      name = Forgery(:LoremIpsum).word(:random => true) + " group"
      description = Forgery(:LoremIpsum).paragraph(:random => true)
      user_id = Forgery(:Basic).number(:at_least => 1, :at_most => 15)
      Group.create!(:name => name,
                    :description => description,
                    :user_id => user_id)
    end
    
    #posts
    40.times do |x|
      name = Forgery(:LoremIpsum).word(:random => true)
      price = Forgery(:Basic).number(:random => true)
      description = Forgery(:LoremIpsum).paragraph(:random => true)
      user_id = Forgery(:Basic).number(:at_least => 1, :at_most => 15)
      
      Post.create!(:name => name,
                   :price => price,
                   :description => description,
                   :user_id => user_id)
    
    end
    
    #memberships
    users = User.all
    users.each { |user|
      2.times do |x|
        begin 
          group_id = Forgery(:Basic).number(:at_least => 1, :at_most => 10)
        end until Membership.create(:group_id => group_id,
                           :member_id => user.id)
      end
    }
    
    
    #assignments
    80.times do |x|
      post_id = Forgery(:Basic).number(:at_least => 1, :at_most => 40)
      group_id = Forgery(:Basic).number(:at_least => 1, :at_most => 10)
      Assignment.create!(:post_id => post_id,
                         :group_id => group_id)
    end
  end
end
    
    
    
    