class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null:false
      t.string :password_digest, null:false
      t.string :session_token

      t.timestamps
      t.index :username, unique: true
      t.index :password_digest, unique: true
    end
  end
end
