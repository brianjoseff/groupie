class AddZipToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :zip, :integer
  end

  def self.down
    remove_column :users, :zip
  end
end
