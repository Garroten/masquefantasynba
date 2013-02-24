class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :id
      t.integer :GP
      t.float :MPG
      t.integer :PTS
      t.float :FGM
      t.float :FGA
      t.float :FG
      t.float :_3PM
      t.float :_3PA
      t.float :_3P
      t.float :FTM
      t.float :FTA
      t.float :FT
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :season
      t.string :player_id

      t.timestamps
    end
  end
end
