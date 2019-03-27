class ChangeColumns < ActiveRecord::Migration[5.2]
  def change
        remove_column :house_table, :house_id
        add_column :people, :house_id, :integer, null:false
  end
end
