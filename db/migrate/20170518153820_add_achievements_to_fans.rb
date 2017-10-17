class AddAchievementsToFans < ActiveRecord::Migration
  def change
    add_column :fans, :achievements, :string
  end
end
