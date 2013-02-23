class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :id
      t.integer :GP
      t.float :MPG
      t.integer :BLK
      t.integer :PF
      t.integer :BLKPG
      t.float :BLKP48M
      t.float :BLK_PF
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :season
      t.integer :player_id

      t.timestamps
    end
  end
end
