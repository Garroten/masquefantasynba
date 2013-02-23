class AddPlayerIdAssists < ActiveRecord::Migration
  def up
    add_column :assists, :player_id, :integer
  end

  def down
    remove_column(:assists, :player_id)
  end
end
