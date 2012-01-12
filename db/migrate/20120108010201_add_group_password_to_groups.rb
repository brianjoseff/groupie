class AddGroupPasswordToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :group_password, :string
  end
end
