class AddPostIdColumnToEmail < ActiveRecord::Migration
  def self.up
    add_column :emails, :post_id, :integer
  end

  def self.down
  end
end
