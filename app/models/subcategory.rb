# == Schema Information
#
# Table name: product_categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Subcategory < ProductCategory
  belongs_to :product_category, :foreign_key => "parent_id"
  
  has_many :posts 
end
