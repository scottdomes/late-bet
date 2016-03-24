class AddGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.belongs_to :user, index: true

      t.string :title
      t.string :stake_item
      t.integer :stake_qty, default: 0 
      t.date :start_date
      t.date :deadline
      t.timestamps 
      
    end
  end
end
