class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.string :name
      t.string :points
      t.string :description

      t.timestamps null: false
    end
  end
end
