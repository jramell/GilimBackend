class AddFollowerCountToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :follower_count, :integer
    add_column :artists, :recommended_count, :integer
    add_column :artists, :facebook_link, :string
    add_column :artists, :twitter_link, :string
    add_column :artists, :instagram_link, :string
  end
end
