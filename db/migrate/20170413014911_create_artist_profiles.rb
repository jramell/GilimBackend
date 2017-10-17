class CreateArtistProfiles < ActiveRecord::Migration
  def change
    create_table :artist_profiles do |t|
      #poner que es única
      t.string :artist_email
      t.string :biography


      t.timestamps null: false
    end
    add_index :artist_profiles, :artist_email, unique: true
  end
end
