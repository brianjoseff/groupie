class AddPremiumMultGroupVizToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :premium_mult_group_viz, :boolean
  end
end
