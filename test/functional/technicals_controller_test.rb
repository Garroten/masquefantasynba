require 'test_helper'

class TechnicalsControllerTest < ActionController::TestCase
  setup do
    @technical = technicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:technicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create technical" do
    assert_difference('Technical.count') do
      post :create, :technical => { :DIV => @technical.DIV, :DQ => @technical.DQ, :FF => @technical.FF, :GP => @technical.GP, :GS => @technical.GS, :P => @technical.P, :PF => @technical.PF, :TF => @technical.TF, :day => @technical.day, :id => @technical.id, :month => @technical.month, :player_id => @technical.player_id, :season => @technical.season, :year => @technical.year }
    end

    assert_redirected_to technical_path(assigns(:technical))
  end

  test "should show technical" do
    get :show, :id => @technical
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @technical
    assert_response :success
  end

  test "should update technical" do
    put :update, :id => @technical, :technical => { :DIV => @technical.DIV, :DQ => @technical.DQ, :FF => @technical.FF, :GP => @technical.GP, :GS => @technical.GS, :P => @technical.P, :PF => @technical.PF, :TF => @technical.TF, :day => @technical.day, :id => @technical.id, :month => @technical.month, :player_id => @technical.player_id, :season => @technical.season, :year => @technical.year }
    assert_redirected_to technical_path(assigns(:technical))
  end

  test "should destroy technical" do
    assert_difference('Technical.count', -1) do
      delete :destroy, :id => @technical
    end

    assert_redirected_to technicals_path
  end
end
