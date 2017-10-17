class CreateFans < ActiveRecord::Migration
  def change
    #, id: false, primary_key: :email -- supuestamente se le añade esto
    create_table :fans, id: false do |t|
      t.string :email, null: false
      t.string :password
      t.string :name
      t.string :longitude
      t.string :latitude
      t.string :likedGenres
      t.string :followedArtists
      t.string :followedEvents
      t.integer :discoveryDistance

      t.timestamps null: false
    end
    add_index :fans, :email, unique: true
  end
end
