class RemovePostIdFromPostImagesAndAddPolymorphic < ActiveRecord::Migration
  def change
    remove_column :post_images, :post_id
    add_column :post_images, :imageable_id, :integer
    add_column :post_images, :imageable_type, :string
  end
end
