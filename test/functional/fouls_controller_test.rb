require 'test_helper'

class FoulsControllerTest < ActionController::TestCase
  setup do
    @foul = fouls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fouls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foul" do
    assert_difference('Foul.count') do
      post :create, :foul => { :GP => @foul.GP, :MPG => @foul.MPG, :PF => @foul.PF, :PFP48M => @foul.PFP48M, :PFPG => @foul.PFPG, :day => @foul.day, :eject => @foul.eject, :id => @foul.id, :month => @foul.month, :player_id => @foul.player_id, :season => @foul.season, :year => @foul.year }
    end

    assert_redirected_to foul_path(assigns(:foul))
  end

  test "should show foul" do
    get :show, :id => @foul
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @foul
    assert_response :success
  end

  test "should update foul" do
    put :update, :id => @foul, :foul => { :GP => @foul.GP, :MPG => @foul.MPG, :PF => @foul.PF, :PFP48M => @foul.PFP48M, :PFPG => @foul.PFPG, :day => @foul.day, :eject => @foul.eject, :id => @foul.id, :month => @foul.month, :player_id => @foul.player_id, :season => @foul.season, :year => @foul.year }
    assert_redirected_to foul_path(assigns(:foul))
  end

  test "should destroy foul" do
    assert_difference('Foul.count', -1) do
      delete :destroy, :id => @foul
    end

    assert_redirected_to fouls_path
  end
end
