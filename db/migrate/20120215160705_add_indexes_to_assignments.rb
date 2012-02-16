class AddIndexesToAssignments < ActiveRecord::Migration
  def change
    add_index :assignments, :group_id
    add_index :assignments, :post_id
    
  end
end
