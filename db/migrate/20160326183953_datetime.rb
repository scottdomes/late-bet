class Datetime < ActiveRecord::Migration
  def change
    remove_column :goals, :deadline
    add_column :goals, :deadline, :datetime
  end
end
