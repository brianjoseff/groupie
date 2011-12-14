class AddProductCategoryIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :product_category_id, :integer
  end

  def self.down
    remove_column :posts, :product_category_id
  end
end
