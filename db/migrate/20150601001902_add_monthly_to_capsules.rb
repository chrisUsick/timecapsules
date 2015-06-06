class AddMonthlyToCapsules < ActiveRecord::Migration
  def change
    add_column :capsules, :monthlyInterval, :boolean
    remove_column :capsules, :interval
  end
end
