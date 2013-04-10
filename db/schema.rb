# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130303135338) do

  create_table "assists", :force => true do |t|
    t.integer  "GP"
    t.float    "MPG"
    t.integer  "AST"
    t.integer  "APG"
    t.integer  "T_O"
    t.integer  "TOPG"
    t.float    "AP48M"
    t.float    "AST_TO"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.string   "season"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "player_id"
  end

  create_table "blocks", :force => true do |t|
    t.integer  "GP"
    t.float    "MPG"
    t.integer  "BLK"
    t.integer  "PF"
    t.integer  "BLKPG"
    t.float    "BLKP48M"
    t.float    "BLK_PF"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.string   "season"
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fouls", :force => true do |t|
    t.integer  "GP"
    t.float    "MPG"
    t.integer  "PF"
    t.integer  "PFPG"
    t.float    "PFP48M"
    t.integer  "eject"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.string   "season"
    t.string   "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "player"
    t.string   "team"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "rookie"
  end

  create_table "rebounds", :force => true do |t|
    t.integer  "GP"
    t.float    "MPG"
    t.integer  "OFF"
    t.float    "ORPG"
    t.integer  "DEF"
    t.float    "DRPG"
    t.integer  "REB"
    t.float    "RPG"
    t.float    "RP40"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.string   "season"
    t.string   "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer  "GP"
    t.float    "MPG"
    t.integer  "PTS"
    t.float    "FGM"
    t.float    "FGA"
    t.float    "FG"
    t.float    "_3PM"
    t.float    "_3PA"
    t.float    "_3P"
    t.float    "FTM"
    t.float    "FTA"
    t.float    "FT"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.string   "season"
    t.string   "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "steals", :force => true do |t|
    t.integer  "GP"
    t.float    "MPG"
    t.integer  "STL"
    t.float    "STPG"
    t.float    "STP48M"
    t.integer  "T_O"
    t.float    "TOPG"
    t.integer  "PF"
    t.float    "ST_TO"
    t.float    "ST_TF"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.string   "season"
    t.string   "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "technicals", :force => true do |t|
    t.string   "_DIV"
    t.string   "P"
    t.integer  "GP"
    t.integer  "GS"
    t.integer  "PF"
    t.integer  "TF"
    t.integer  "FF"
    t.integer  "DQ"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.string   "season"
    t.string   "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "turnovers", :force => true do |t|
    t.integer  "GP"
    t.float    "MPG"
    t.integer  "T_O"
    t.float    "TOPG"
    t.float    "TO48"
    t.float    "AST_TO"
    t.float    "STL_TO"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.string   "season"
    t.string   "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
