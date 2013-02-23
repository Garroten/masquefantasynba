require 'test_helper'

class AssistsControllerTest < ActionController::TestCase
  setup do
    @assist = assists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assist" do
    assert_difference('Assist.count') do
      post :create, :assist => { :AP48M => @assist.AP48M, :APG => @assist.APG, :AST => @assist.AST, :AST_TO => @assist.AST_TO, :GP => @assist.GP, :MPG => @assist.MPG, :TOPG => @assist.TOPG, :T_O => @assist.T_O, :day => @assist.day, :id => @assist.id, :month => @assist.month, :season => @assist.season, :year => @assist.year }
    end

    assert_redirected_to assist_path(assigns(:assist))
  end

  test "should show assist" do
    get :show, :id => @assist
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @assist
    assert_response :success
  end

  test "should update assist" do
    put :update, :id => @assist, :assist => { :AP48M => @assist.AP48M, :APG => @assist.APG, :AST => @assist.AST, :AST_TO => @assist.AST_TO, :GP => @assist.GP, :MPG => @assist.MPG, :TOPG => @assist.TOPG, :T_O => @assist.T_O, :day => @assist.day, :id => @assist.id, :month => @assist.month, :season => @assist.season, :year => @assist.year }
    assert_redirected_to assist_path(assigns(:assist))
  end

  test "should destroy assist" do
    assert_difference('Assist.count', -1) do
      delete :destroy, :id => @assist
    end

    assert_redirected_to assists_path
  end
end
