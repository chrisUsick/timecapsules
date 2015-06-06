class AddEventDateToCapsules < ActiveRecord::Migration
  def change
    add_column :capsules, :eventDate, :date
  end
end
