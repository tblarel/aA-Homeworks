class Updatehousetable < ActiveRecord::Migration[5.2]
  def change
      remove_column :houses, :house_id
  end
end
