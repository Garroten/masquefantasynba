class AddRookiePlayers < ActiveRecord::Migration
  def up
    add_column :players, :rookie, :boolean
  end

  def down
    remove_column(:players, :rookie)
  end
end
