class AddUserIdToCapsules < ActiveRecord::Migration
  def change
    add_reference :capsules, :user, index: true
  end
end
