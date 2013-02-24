class CreateRebounds < ActiveRecord::Migration
  def change
    create_table :rebounds do |t|
      t.integer :id
      t.integer :GP
      t.float :MPG
      t.integer :OFF
      t.float :ORPG
      t.integer :DEF
      t.float :DRPG
      t.integer :REB
      t.float :RPG
      t.float :RP40
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :season
      t.string :player_id

      t.timestamps
    end
  end
end
