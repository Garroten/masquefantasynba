class CreateTurnovers < ActiveRecord::Migration
  def change
    create_table :turnovers do |t|
      t.integer :id
      t.integer :GP
      t.float :MPG
      t.integer :T_O
      t.float :TOPG
      t.float :TO48
      t.float :AST_TO
      t.float :STL_TO
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :season
      t.string :player_id

      t.timestamps
    end
  end
end
