class ArtistProfilesController < ApplicationController
  before_action :set_artist_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_image, only: [:create, :update]

  # GET /artist_profiles
  # GET /artist_profiles.json
  def index
    if (params[:artist_email])
      @artist = find_artist(params[:artist_email])
        @artist_profiles = @artist.artist_profiles
     #  << @artist.artist_profile
    else
      @artist_profiles = ArtistProfile.all
    end
    
  end

  # GET /artist_profiles/1
  # GET /artist_profiles/1.json
  def show
  end

  # GET /artist_profiles/new
  def new
    @artist_profile = ArtistProfile.new
  end

  # GET /artist_profiles/1/edit
  def edit
  end

  # POST /artist_profiles
  # POST /artist_profiles.json
  def create
    #sets image in before_action
    puts "ARTIST EMAIL ----- #{artist_profile_params[:artist_email]}"
    @artist_profile = ArtistProfile.new(artist_profile_params)
    respond_to do |format|
      if @artist_profile.save
        format.html { redirect_to @artist_profile, notice: 'Artist profile was successfully created.' }
        format.json { render :show, status: :created, location: @artist_profile }
      else
        format.html { render :new }
        format.json { render json: @artist_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artist_profiles/1
  # PATCH/PUT /artist_profiles/1.json
  def update
    #sets image in before_action
    respond_to do |format|
      if @artist_profile.update(artist_profile_params)
        format.html { redirect_to @artist_profile, notice: 'Artist profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist_profile }
      else
        format.html { render :edit }
        format.json { render json: @artist_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artist_profiles/1
  # DELETE /artist_profiles/1.json
  def destroy
    @artist_profile.destroy
    respond_to do |format|
      format.html { redirect_to artist_profiles_url, notice: 'Artist profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_image
        if (params[:artist_profile][:image])
          if (params[:artist_profile][:image]["link"])
            params[:artist_profile][:image] = Attachment.new(url: params[:artist_profile][:image]["link"])
          else
            params[:artist_profile][:image] = process_image(params[:artist_profile][:image]["base64"], params[:artist_profile][:image]["original_filename"], params[:artist_profile][:image]["content_type"])
          end
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_profile
      @artist_profile = ArtistProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_profile_params
      params.require(:artist_profile).permit(:artist_email, :biography, :image)
    end
end
