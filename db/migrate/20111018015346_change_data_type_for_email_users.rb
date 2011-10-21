class ChangeDataTypeForEmailUsers < ActiveRecord::Migration
  def self.up
    change_table :emails do |t|
          t.change :to, :integer
          t.change :from, :integer
    end
  end

  def self.down
    change_table :emails do |t|
          t.change :to, :string
          t.change :from, :string
    end
  end
end
