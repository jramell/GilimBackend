class AddAttachmentImageToPresentationCards < ActiveRecord::Migration
  def self.up
    change_table :presentation_cards do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :presentation_cards, :image
  end
end
