class ArtistProfile < ActiveRecord::Base
  belongs_to :artist, foreign_key: :artist_email, primary_key: :email 
  
  has_attached_file :image, :url => ':s3_domain_url'
  #validates :image, attachment_presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :artist_email, presence: true
end
