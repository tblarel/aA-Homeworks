class AddFkToTracks < ActiveRecord::Migration[5.2]
  def change
      add_foreign_key :tracks, :albums
  end
end
