class ChangeDataTypeForEmailUsers < ActiveRecord::Migration
  def self.up
      change_column :emails, :to, integer
      change_column :emails, :from, integer
  end

  def self.down
      change_column :to, :string
      change_column :from, :string
  end
end
