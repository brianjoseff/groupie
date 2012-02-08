class AddQuestionToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :question, :string
  end
end
