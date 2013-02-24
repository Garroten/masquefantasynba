class CreateFouls < ActiveRecord::Migration
  def change
    create_table :fouls do |t|
      t.integer :id
      t.integer :GP
      t.float :MPG
      t.integer :PF
      t.integer :PFPG
      t.float :PFP48M
      t.integer :eject
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :season
      t.string :player_id

      t.timestamps
    end
  end
end
