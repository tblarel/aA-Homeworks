class AddColumnToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :recording_type, :boolean, null: false
  end
end
