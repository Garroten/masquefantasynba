require 'test_helper'

class BlocksControllerTest < ActionController::TestCase
  setup do
    @block = blocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create block" do
    assert_difference('Block.count') do
      post :create, :block => { :BLK => @block.BLK, :BLKP48M => @block.BLKP48M, :BLKPG => @block.BLKPG, :BLK_PF => @block.BLK_PF, :GP => @block.GP, :MPG => @block.MPG, :PF => @block.PF, :day => @block.day, :id => @block.id, :month => @block.month, :player_id => @block.player_id, :season => @block.season, :year => @block.year }
    end

    assert_redirected_to block_path(assigns(:block))
  end

  test "should show block" do
    get :show, :id => @block
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @block
    assert_response :success
  end

  test "should update block" do
    put :update, :id => @block, :block => { :BLK => @block.BLK, :BLKP48M => @block.BLKP48M, :BLKPG => @block.BLKPG, :BLK_PF => @block.BLK_PF, :GP => @block.GP, :MPG => @block.MPG, :PF => @block.PF, :day => @block.day, :id => @block.id, :month => @block.month, :player_id => @block.player_id, :season => @block.season, :year => @block.year }
    assert_redirected_to block_path(assigns(:block))
  end

  test "should destroy block" do
    assert_difference('Block.count', -1) do
      delete :destroy, :id => @block
    end

    assert_redirected_to blocks_path
  end
end
