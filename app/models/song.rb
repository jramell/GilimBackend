class Song < ActiveRecord::Base
  belongs_to :artist, foreign_key: :artist_email, primary_key: :email  
  
  validates :artist_email, presence: true
end
