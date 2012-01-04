class RemoveImageFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :image_file_name, :string
    remove_column :posts, :image_content_type, :string
    remove_column :posts, :image_file_size, :integer
    remove_column :posts, :image_updated_at, :datetime
  end

  def self.down
    add_column :posts, :image_file_name
    add_column :posts, :image_content_type
    add_column :posts, :image_file_size
    add_column :posts, :image_updated_at
  end
end
