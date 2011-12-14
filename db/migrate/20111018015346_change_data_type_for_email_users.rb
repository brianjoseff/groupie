class ChangeDataTypeForEmailUsers < ActiveRecord::Migration
  def self.up
    change_table :emails do |t|
          t.change :emails, :to, :integer
          t.change :emails, :from, :integer
    end
  end

  def self.down
    change_table :emails do |t|
          t.change :to, :string
          t.change :from, :string
    end
  end
end
