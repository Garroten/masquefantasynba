class CreateSteals < ActiveRecord::Migration
  def change
    create_table :steals do |t|
      t.integer :id
      t.integer :GP
      t.float :MPG
      t.integer :STL
      t.float :STPG
      t.float :STP48M
      t.integer :T_O
      t.float :TOPG
      t.integer :PF
      t.float :ST_TO
      t.float :ST_TF
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :season
      t.string :player_id

      t.timestamps
    end
  end
end
