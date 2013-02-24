require 'test_helper'

class TurnoversControllerTest < ActionController::TestCase
  setup do
    @turnover = turnovers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turnovers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turnover" do
    assert_difference('Turnover.count') do
      post :create, :turnover => { :AST_TO => @turnover.AST_TO, :GP => @turnover.GP, :MPG => @turnover.MPG, :STL_TO => @turnover.STL_TO, :TO48 => @turnover.TO48, :TOPG => @turnover.TOPG, :T_O => @turnover.T_O, :day => @turnover.day, :id => @turnover.id, :month => @turnover.month, :player_id => @turnover.player_id, :season => @turnover.season, :year => @turnover.year }
    end

    assert_redirected_to turnover_path(assigns(:turnover))
  end

  test "should show turnover" do
    get :show, :id => @turnover
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @turnover
    assert_response :success
  end

  test "should update turnover" do
    put :update, :id => @turnover, :turnover => { :AST_TO => @turnover.AST_TO, :GP => @turnover.GP, :MPG => @turnover.MPG, :STL_TO => @turnover.STL_TO, :TO48 => @turnover.TO48, :TOPG => @turnover.TOPG, :T_O => @turnover.T_O, :day => @turnover.day, :id => @turnover.id, :month => @turnover.month, :player_id => @turnover.player_id, :season => @turnover.season, :year => @turnover.year }
    assert_redirected_to turnover_path(assigns(:turnover))
  end

  test "should destroy turnover" do
    assert_difference('Turnover.count', -1) do
      delete :destroy, :id => @turnover
    end

    assert_redirected_to turnovers_path
  end
end
