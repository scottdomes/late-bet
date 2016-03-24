class AddBets < ActiveRecord::Migration
  
  def change
    create_table :bets do |t|
      t.belongs_to :user, index: true
      t.belongs_to :goal, index: true

      t.boolean :paid, default: false
      t.timestamps
    
    end
  end
end
