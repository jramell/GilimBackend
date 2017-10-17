class CreateArtists < ActiveRecord::Migration
  def change
    #supuestamente se le añade , id: false, primary_key: :email
    create_table :artists, id: false do |t|
      t.string :email, null: false
      #aún no, luego será importante
      #t.string :assists_to_events
      t.string :password
      t.string :latitude
      t.string :longitude
      t.string :name
      t.string :genres
      t.integer :followerCount
      t.string :facebook_url
      t.string :twitter_url
      t.string :instagram_url

      t.timestamps null: false
    end
    add_index :artists, :email, unique: true
  end
end
