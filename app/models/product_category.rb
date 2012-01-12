class ProductCategory < ActiveRecord::Base
  has_many :subcategories, :foreign_key => "parent_id"
  has_many :posts
  
end
