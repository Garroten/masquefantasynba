class CreateTechnicals < ActiveRecord::Migration
  def change
    create_table :technicals do |t|
      t.integer :id
      t.string :_DIV
      t.string :P
      t.integer :GP
      t.integer :GS
      t.integer :PF
      t.integer :TF
      t.integer :FF
      t.integer :DQ
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :season
      t.string :player_id

      t.timestamps
    end
  end
end
