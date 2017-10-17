class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  def set_fan()
    if (params[:email])
      begin
        realKey = get_real_key(params[:email])
        @fan = Fan.find(realKey)
      rescue ActiveRecord::RecordNotFound
        @fan = Fan.new(email:"NotFound")
      end
    end
  end
  
  def get_real_key(emailMod)
    emailSplit = emailMod.split('@')
    realDomain = emailSplit.last.gsub("<", ".")
    key = "#{emailSplit.first}@#{realDomain}"
    return key
  end
  
  def find_artist(email)
      begin
        realKey = get_real_key(email)
        @foundArtist = Artist.find(realKey)
      rescue ActiveRecord::RecordNotFound
        @foundArtist = Artist.new(email:"NotFound")
      end
  end
  
  def find_genre(id)
      begin
        @foundGenre = Genre.find(id)
      rescue ActiveRecord::RecordNotFound
        @foundGenre = Genre.new(name:"NotFound-GenreWithID-#{id}")
      end
  end
  
  def find_event(id)
      begin
        @foundEvent = Event.find(id)
      rescue ActiveRecord::RecordNotFound
        @foundEvent = Event.new(id: -1, name:"NotFound-EventWithID-#{id}")
      end
      return @foundEvent
  end
  
  
  def process_image(base64image, original_filename, content_type)
         #create a new tempfile named fileupload
        tempfile = Tempfile.new("fileupload")
        tempfile.binmode
         #get the file and decode it with base64 then write it to the tempfile
        tempfile.write(Base64.decode64(base64image))

         #create a new uploaded file
        uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, 
          :filename => original_filename, :original_filename => original_filename,
          :type => content_type) 
        
        return uploaded_file
  end       
end
