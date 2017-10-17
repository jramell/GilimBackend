class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :artist_email
      t.string :latitude
      t.string :longitude
      t.string :name
      t.string :placeName
      t.string :description
      t.string :assistants
      t.string :assist_requests 
      t.string :date
      t.integer :followerCount
      t.string :converted_image

      t.timestamps null: false
    end
    add_index :events, :artist_email
    #add_reference :events, :artist, index: true, foreign_key: true, primary_key: :email
  end
end
