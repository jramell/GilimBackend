class AddAttachmentImageToArtistprofiles < ActiveRecord::Migration
  def self.up
    change_table :artist_profiles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :artist_profiles, :image
  end
end
