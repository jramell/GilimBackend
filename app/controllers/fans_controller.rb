class FansController < ApplicationController
  before_action :set_fan, only: [:show, :edit, :update, :destroy, :followevent, :followartist, :recommendedartists, :recommendedevents]

  # GET /fans
  # GET /fans.json
  def index
    @fans = Fan.all
  end

  # GET /fans/1
  # GET /fans/1.json
  def show
    
  end

  # GET /fans/new
  def new
    @fan = Fan.new
  end

  # GET /fans/1/edit
  def edit
  end

  # POST /fans
  # POST /fans.json
  def create
      if (params[:fan][:email])
    begin
        @fan = Fan.find(params[:fan][:email])
    rescue ActiveRecord::RecordNotFound
        @fan = Fan.new(email:"NotFound")
    end

    
    if (@fan.email != "NotFound")
      respond_to do |format|
        if true
          format.html { redirect_to @fan, notice: 'Fan was successfully created.' }
          format.json { render :show, status: :created, location: @fan }
        else
          format.html { render :new }
          format.json { render json: @fan.errors, status: :unprocessable_entity }
        end
      end
      return
    end
    end
      @fan = Fan.new(fan_params)
    respond_to do |format|
      if @fan.save
        format.html { redirect_to @fan, notice: 'Fan was successfully created.' }
        format.json { render :show, status: :created, location: @fan }
      else
        format.html { render :new }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fans/1
  # PATCH/PUT /fans/1.json
  def update
    respond_to do |format|
      if @fan.update(fan_update_params)
        format.html { redirect_to @fan, notice: 'Fan was successfully updated.' }
        format.json { render :show, status: :ok, location: @fan }
      else
        format.html { render :edit }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fans/1
  # DELETE /fans/1.json
  def destroy
    @fan.destroy
    respond_to do |format|
      format.html { redirect_to fans_url, notice: 'Fan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
    def followevent
      if (params[:event_id])
        @eventToUpdate = find_event(params[:event_id])
        if (@eventToUpdate.id == -1)
          return
        end
      else
        @eventToUpdate = Event.new(id:-1, name:"NotReceived-event_id")
        return    
      end
      
      @eventToUpdate.followerCount += 1;
      @eventToUpdate.update
      
      if (@fan.followedEvents != "" && !@fan.followedEvents.nil?)
          @fan.followedEvents += ",#{params[:event_id]}"
          
      else
          @fan.followedEvents = paramsa[:event_id]
      end
      @fan.save
    end
    
    def followartist
      if (params[:artist_email])
        @artistToUpdate = find_artist(params[:artist_email])
        if (@artistToUpdate.email == "NotFound")
            return
        end
        
      else
        @artistToUpdate = Artist.new(email:"NotReceived-artist_email", name:"NotReceived-artist_email")
        return    
      end
      
      @artistToUpdate.followerCount = @artistToUpdate.followerCount + 1
      @artistToUpdate.save
      
      if (@fan.followedArtists != "" && !@fan.followedArtists.nil?)
          @fan.followedArtists += ",#{params[:artist_email]}"
          
      else
          @fan.followedArtists = params[:artist_email]
      end
      @fan.save
    end 
    
    def recommendedartists
      @recommendedArtists = Artist.all - get_followed_artists_list
    end
    
    def recommendedevents
      @recommendedEvents = Event.all - get_followed_events_list
    end
    
  private
    # Fan is called from application_controller
  #  def set_fan
  #    begin
  #      emailSplit = params[:email].split('@')
  #      realDomain = emailSplit.last.gsub("<", ".")
  #      realKey = "#{emailSplit.first}@#{realDomain}"
  #      @fan = Fan.find(realKey)
  #    rescue ActiveRecord::RecordNotFound
  #      @fan = Fan.new(email:"NotFound")
  #    end
  #  end

    def get_followed_artists_list
      set_fan
      if (@fan.followedArtists.nil? || @fan.followedArtists == "")
        return Array.new
      end
      followedArtistsSplit = @fan.followedArtists.split(",")
      artistList = Array.new
      followedArtistsSplit.each do |followedArtistEmail|
        artistList << find_artist(followedArtistEmail)
      end
      return artistList
    end
    
    def get_followed_events_list
      set_fan
      if (@fan.followedEvents.nil? || @fan.followedEvents == "")
        return Array.new
      end
      followedEventsSplit = @fan.followedEvents.split(",")
      eventList = Array.new
      followedEventsSplit.each do |followedEventID|
        eventList << find_event(followedEventID)
      end
      return eventList
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def fan_params
      params.require(:fan).permit(:email, :password, :name, :longitude, :latitude, :achievements, :followedArtists, :followedEvents, :discoveryDistance, :likedGenres, :event_id, :artist_email)
    end
    
    def fan_update_params
      params.require(:fan).permit(:email, :password, :name, :longitude, :latitude, :achievements, :discoveryDistance)
    end
end