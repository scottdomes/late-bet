class AddColumns < ActiveRecord::Migration
  def change
      
      remove_column :users, :name

      change_table :goals do |t|
        t.boolean :fail, default: false
        t.boolean :success, default: false
      end  

      change_table :users do |t|
        t.string :first_name
        t.string :last_name
        t.string :username
        
      end  

  end


end
