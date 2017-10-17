json.extract! artist_profile, :id, :artist_email, :biography, :image, :created_at, :updated_at
json.url artist_profile_url(artist_profile, format: :json)