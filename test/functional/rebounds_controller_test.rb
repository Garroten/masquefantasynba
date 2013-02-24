require 'test_helper'

class ReboundsControllerTest < ActionController::TestCase
  setup do
    @rebound = rebounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rebounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rebound" do
    assert_difference('Rebound.count') do
      post :create, :rebound => { :DEF => @rebound.DEF, :DRPG => @rebound.DRPG, :GP => @rebound.GP, :MPG => @rebound.MPG, :OFF => @rebound.OFF, :ORPG => @rebound.ORPG, :REB => @rebound.REB, :RP40 => @rebound.RP40, :RPG => @rebound.RPG, :day => @rebound.day, :id => @rebound.id, :month => @rebound.month, :player_id => @rebound.player_id, :season => @rebound.season, :year => @rebound.year }
    end

    assert_redirected_to rebound_path(assigns(:rebound))
  end

  test "should show rebound" do
    get :show, :id => @rebound
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rebound
    assert_response :success
  end

  test "should update rebound" do
    put :update, :id => @rebound, :rebound => { :DEF => @rebound.DEF, :DRPG => @rebound.DRPG, :GP => @rebound.GP, :MPG => @rebound.MPG, :OFF => @rebound.OFF, :ORPG => @rebound.ORPG, :REB => @rebound.REB, :RP40 => @rebound.RP40, :RPG => @rebound.RPG, :day => @rebound.day, :id => @rebound.id, :month => @rebound.month, :player_id => @rebound.player_id, :season => @rebound.season, :year => @rebound.year }
    assert_redirected_to rebound_path(assigns(:rebound))
  end

  test "should destroy rebound" do
    assert_difference('Rebound.count', -1) do
      delete :destroy, :id => @rebound
    end

    assert_redirected_to rebounds_path
  end
end
