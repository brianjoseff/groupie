class AddTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_4_digits, :string
    add_column :users, :stripe_id, :string
    add_column :users, :subscribed, :boolean
    add_column :users, :stripe_customer_token, :string
  end

  def self.down
    remove_column :users, :last_4_digits
    remove_column :users, :stripe_id
    remove_column :users, :subscribed
    remove_column :users, :stripe_customer_token
  end
end