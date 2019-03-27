class RemovePersonHouseId < ActiveRecord::Migration[5.2]
  def change
    remove_column :people, :house_id
  end
end
