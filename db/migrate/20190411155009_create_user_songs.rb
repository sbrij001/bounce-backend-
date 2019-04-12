class CreateUserSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_songs do |t|
      t.string :song
      t.references :webplayer, foreign_key: true

      t.timestamps
    end
  end
end
