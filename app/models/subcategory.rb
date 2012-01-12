class Subcategory < ProductCategory
  belongs_to :product_category, :foreign_key => "parent_id"
  
  has_many :posts 
end