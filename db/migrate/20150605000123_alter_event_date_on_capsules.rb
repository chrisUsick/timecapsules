class AlterEventDateOnCapsules < ActiveRecord::Migration
  def change
    change_column :capsules, :eventDate, :date, :default => Date.new
  end
end
