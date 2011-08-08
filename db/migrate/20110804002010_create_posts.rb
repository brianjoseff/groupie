class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :name
      t.boolean :borrow
      t.integer :price
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
