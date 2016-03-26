class Notifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true
      t.integer :other_user_id
      t.string :content
      t.timestamps
    end
  end
end
