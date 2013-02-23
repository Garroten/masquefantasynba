class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :id
      t.string :player
      t.string :team

      t.timestamps
    end
  end
end
