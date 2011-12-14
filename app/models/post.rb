class Post < ActiveRecord::Base
  #has_many :images
  has_many :emails
  belongs_to :user
  belongs_to :product_category
  has_many :assignments, :dependent => :destroy
  has_many :groups, :through => :assignments
  has_attached_file :image, :styles => { :thumb => "100x100",
                                         :small => "200x200" },
                            :path => ":rails_root/public/system/images/:id/:style/:basename.:extension",
                            :default_url => "/system/images/missing/:style.png"
  searchable do
    text :name, :description
  end
                          
  def self.rand_post(group)
    #find_by_id(get_assignment_post_id(assignments))
    z = group.assignments.first(:order => "RANDOM()")
    if z.nil?
      return nil
    end
    find(z.post_id)
    #assignments.offset(rand(assignments.count)).first
  end
  def get_assignment_post_id(assignments)
    return assignments.first(:order => "RANDOM()").post_id
  end
end
