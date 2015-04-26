class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.string :magnitude
      t.string :radius
      t.string :zipcode

      t.timestamps
    end
  end
end
