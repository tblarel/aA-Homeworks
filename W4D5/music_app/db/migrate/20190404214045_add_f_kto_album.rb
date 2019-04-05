class AddFKtoAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :band_id, :integer, null:false
    add_foreign_key :albums, :bands
  end
end
