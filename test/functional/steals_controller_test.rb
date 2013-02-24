require 'test_helper'

class StealsControllerTest < ActionController::TestCase
  setup do
    @steal = steals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create steal" do
    assert_difference('Steal.count') do
      post :create, :steal => { :GP => @steal.GP, :MPG => @steal.MPG, :PF => @steal.PF, :STL => @steal.STL, :STP48M => @steal.STP48M, :STPG => @steal.STPG, :ST_TF => @steal.ST_TF, :ST_TO => @steal.ST_TO, :TOPG => @steal.TOPG, :T_O => @steal.T_O, :day => @steal.day, :id => @steal.id, :month => @steal.month, :player_id => @steal.player_id, :season => @steal.season, :year => @steal.year }
    end

    assert_redirected_to steal_path(assigns(:steal))
  end

  test "should show steal" do
    get :show, :id => @steal
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @steal
    assert_response :success
  end

  test "should update steal" do
    put :update, :id => @steal, :steal => { :GP => @steal.GP, :MPG => @steal.MPG, :PF => @steal.PF, :STL => @steal.STL, :STP48M => @steal.STP48M, :STPG => @steal.STPG, :ST_TF => @steal.ST_TF, :ST_TO => @steal.ST_TO, :TOPG => @steal.TOPG, :T_O => @steal.T_O, :day => @steal.day, :id => @steal.id, :month => @steal.month, :player_id => @steal.player_id, :season => @steal.season, :year => @steal.year }
    assert_redirected_to steal_path(assigns(:steal))
  end

  test "should destroy steal" do
    assert_difference('Steal.count', -1) do
      delete :destroy, :id => @steal
    end

    assert_redirected_to steals_path
  end
end
