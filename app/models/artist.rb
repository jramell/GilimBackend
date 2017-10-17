class Artist < ActiveRecord::Base
    self.primary_key = 'email'
    #apparently, foreign_key and primary_key do nothing
    has_many :events, foreign_key: :artist_email, primary_key: :email
    has_many :songs, foreign_key: :artist_email, primary_key: :email
    #no valida que haya sólo una
    has_many :presentation_cards, foreign_key: :artist_email, primary_key: :email
    #no valida que haya sólo una
    has_many :artist_profiles, foreign_key: :artist_email, primary_key: :email
    validates :email, presence: true, allow_blank: false 
    validates :name, presence: true, allow_blank: false#, length: { minimum: 1, maximum: 50 }
    validates :genres, presence: true, allow_blank: false 
    validates :password, presence: true, allow_blank: false #, length: { minimum: 8, maximum:30 }
end
