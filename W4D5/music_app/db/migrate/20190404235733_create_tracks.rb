class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :album_id, null: false
      t.integer :ord, null: false
      t.boolean :track_type, null: false
      #type = 0 : regular track  |  type = 1 : bonus track
      t.text :lyrics
      t.timestamps
    end
  end
end
