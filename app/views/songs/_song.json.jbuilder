json.extract! song, :id, :song_url, :name, :duration, :artist_email, :created_at, :updated_at
json.url song_url(song, format: :json)