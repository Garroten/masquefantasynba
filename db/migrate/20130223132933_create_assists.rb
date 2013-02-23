class CreateAssists < ActiveRecord::Migration
  def change
    create_table :assists do |t|
      t.integer :id
      t.integer :GP
      t.float :MPG
      t.integer :AST
      t.integer :APG
      t.integer :T_O
      t.integer :TOPG
      t.float :AP48M
      t.float :AST_TO
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :season

      t.timestamps
    end
  end
end
