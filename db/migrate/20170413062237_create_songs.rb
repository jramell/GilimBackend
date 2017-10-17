class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist_email
      t.string :song_url
      t.string :soundcloud_url
      t.string :name
      t.string :duration
      

      t.timestamps null: false
    end
    add_index :songs, :artist_email
  end
end
