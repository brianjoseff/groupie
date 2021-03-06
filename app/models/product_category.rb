# == Schema Information
#
# Table name: product_categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ProductCategory < ActiveRecord::Base
  has_many :subcategories, :foreign_key => "parent_id"
  has_many :posts
  
end
