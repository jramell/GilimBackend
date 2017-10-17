class CreatePresentationCards < ActiveRecord::Migration
  def change
    create_table :presentation_cards do |t|
      t.string :artist_email
      t.belongs_to :song, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :presentation_cards, :artist_email, unique: true
  end
end
