class CreateHouseTable < ActiveRecord::Migration[5.2]
  def change
    create_table :house_table do |t|
      t.integer :house_id, null:false
      t.string :address, null:false
    end
  end
end
