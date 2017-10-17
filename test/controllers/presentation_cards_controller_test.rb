require 'test_helper'

class PresentationCardsControllerTest < ActionController::TestCase
  setup do
    @presentation_card = presentation_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presentation_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presentation_card" do
    assert_difference('PresentationCard.count') do
      post :create, presentation_card: { artist_id: @presentation_card.artist_id, song_id: @presentation_card.song_id }
    end

    assert_redirected_to presentation_card_path(assigns(:presentation_card))
  end

  test "should show presentation_card" do
    get :show, id: @presentation_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presentation_card
    assert_response :success
  end

  test "should update presentation_card" do
    patch :update, id: @presentation_card, presentation_card: { artist_id: @presentation_card.artist_id, song_id: @presentation_card.song_id }
    assert_redirected_to presentation_card_path(assigns(:presentation_card))
  end

  test "should destroy presentation_card" do
    assert_difference('PresentationCard.count', -1) do
      delete :destroy, id: @presentation_card
    end

    assert_redirected_to presentation_cards_path
  end
end
