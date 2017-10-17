class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if (params[:artist_email])
      @artist = find_artist(params[:artist_email])
      if (@artist.email != "NotFound")
        @events = @artist.events
      else
        @events = [Event.new(id:-2,name:"NotFound-ArtistWithEmail-#{get_real_key(params[:artist_email])}")]
      end
    else
      @events = Event.all
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    if (params[:event][:image])
      params[:event][:image] = process_image(params[:event][:image]["base64"], params[:event][:image]["original_filename"], params[:event][:image]["content_type"])
    end
    @event = Event.new(event_params)
    check_minimum_assistants
    @event.assist_requests = ""
    @event.followerCount = 0
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if (params[:event][:image])
      params[:event][:image] = process_image(params[:event][:image]["base64"], params[:event][:image]["original_filename"], params[:event][:image]["content_type"])
    end
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = find_event(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:artist_email, :latitude, :longitude, :name, :placeName, :description, :assistants, :date, :converted_image, :image, :assist_requests, :facebook_link, :twitter_link, :instagram_link)
    end
    
    def check_minimum_assistants
      if @event.assistants.nil? || @event.assistants.empty?
        @event.assistants = @event.artist_email
      end
    end
end
