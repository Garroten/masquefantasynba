require 'test_helper'

class ScoresControllerTest < ActionController::TestCase
  setup do
    @score = scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score" do
    assert_difference('Score.count') do
      post :create, :score => { :3P => @score.3P, :3PA => @score.3PA, :3PM => @score.3PM, :FG => @score.FG, :FGA => @score.FGA, :FGM => @score.FGM, :FT => @score.FT, :FTA => @score.FTA, :FTM => @score.FTM, :GP => @score.GP, :MPG => @score.MPG, :PTS => @score.PTS, :day => @score.day, :id => @score.id, :month => @score.month, :player_id => @score.player_id, :season => @score.season, :year => @score.year }
    end

    assert_redirected_to score_path(assigns(:score))
  end

  test "should show score" do
    get :show, :id => @score
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @score
    assert_response :success
  end

  test "should update score" do
    put :update, :id => @score, :score => { :3P => @score.3P, :3PA => @score.3PA, :3PM => @score.3PM, :FG => @score.FG, :FGA => @score.FGA, :FGM => @score.FGM, :FT => @score.FT, :FTA => @score.FTA, :FTM => @score.FTM, :GP => @score.GP, :MPG => @score.MPG, :PTS => @score.PTS, :day => @score.day, :id => @score.id, :month => @score.month, :player_id => @score.player_id, :season => @score.season, :year => @score.year }
    assert_redirected_to score_path(assigns(:score))
  end

  test "should destroy score" do
    assert_difference('Score.count', -1) do
      delete :destroy, :id => @score
    end

    assert_redirected_to scores_path
  end
end
