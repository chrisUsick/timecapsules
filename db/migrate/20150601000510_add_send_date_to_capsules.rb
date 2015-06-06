class AddSendDateToCapsules < ActiveRecord::Migration
  def change
    add_column :capsules, :sendDate, :date
    add_column :capsules, :interval, :integer
  end
end
