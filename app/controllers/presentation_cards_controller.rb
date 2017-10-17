class PresentationCardsController < ApplicationController
  before_action :set_presentation_card, only: [:show, :edit, :update, :destroy]

  # GET /presentation_cards
  # GET /presentation_cards.json
  def index
    if (params[:artist_email])
      @artist = find_artist(params[:artist_email])
      if (@artist.email != "NotFound")
        @presentation_cards = @artist.presentation_cards
      else
        @presentation_cards = [PresentationCard.new(id:-1, artist_email:"NotFound-ArtistWithEmail-#{get_real_key(params[:artist_email])}")]
      end
    else
      @presentation_cards = PresentationCard.all
    end
  end

  # GET /presentation_cards/1
  # GET /presentation_cards/1.json
  def show
  end

  # GET /presentation_cards/new
  def new
    @presentation_card = PresentationCard.new
  end

  # GET /presentation_cards/1/edit
  def edit
  end

  # POST /presentation_cards
  # POST /presentation_cards.json
  def create
      if (params[:presentation_card][:image])
        params[:presentation_card][:image] = process_image(params[:presentation_card][:image]["base64"], params[:presentation_card][:image]["original_filename"], params[:presentation_card][:image]["content_type"])
      end
    @presentation_card = PresentationCard.new(presentation_card_params)
    respond_to do |format|
      if @presentation_card.save
        format.html { redirect_to @presentation_card, notice: 'Presentation card was successfully created.' }
        format.json { render :show, status: :created, location: @presentation_card }
      else
        format.html { render :new }
        format.json { render json: @presentation_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentation_cards/1
  # PATCH/PUT /presentation_cards/1.json
  def update
      if (params[:presentation_card][:image])
        params[:presentation_card][:image] = process_image(params[:presentation_card][:image]["base64"], params[:presentation_card][:image]["original_filename"], params[:presentation_card][:image]["content_type"])
      end
    respond_to do |format|
      if @presentation_card.update(presentation_card_params)
        format.html { redirect_to @presentation_card, notice: 'Presentation card was successfully updated.' }
        format.json { render :show, status: :ok, location: @presentation_card }
      else
        format.html { render :edit }
        format.json { render json: @presentation_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentation_cards/1
  # DELETE /presentation_cards/1.json
  def destroy
    @presentation_card.destroy
    respond_to do |format|
      format.html { redirect_to presentation_cards_url, notice: 'Presentation card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation_card
      @presentation_card = PresentationCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_card_params
      params.require(:presentation_card).permit(:artist_email, :image, :song_id)
    end
end
