class Createhousetable < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.integer :house_id, null:false
      t.string :address, null:false
    end
    drop_table :house_table
  end
end
