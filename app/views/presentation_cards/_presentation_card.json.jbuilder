json.extract! presentation_card, :id, :artist_email, :song_id, :image, :created_at, :updated_at
json.url presentation_card_url(presentation_card, format: :json)