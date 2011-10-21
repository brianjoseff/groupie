class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :subject
      t.text :content
      t.string :to
      t.string :from

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
