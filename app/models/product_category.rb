class ProductCategory < ActiveRecord::Base
  has_many :posts
end
