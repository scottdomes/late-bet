class AddUsers < ActiveRecord::Migration
  def change
  create_table :users do |t|
    t.string :name
    t.string :email
    t.string :image_file_name, :image_content_type
    t.timestamps
    end
  end
end
