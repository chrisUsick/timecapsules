class AlterDefaultEventDateOnCapsules < ActiveRecord::Migration
  def change
    change_column :capsules, :eventDate, :date, :default => Date.today
  end
end
