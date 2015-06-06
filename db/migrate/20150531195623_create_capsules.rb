class CreateCapsules < ActiveRecord::Migration
  def change
    create_table :capsules do |t|
      t.string :title
      t.text :message
      t.references :user, index: true
      t.timestamps
    end
  end
end
