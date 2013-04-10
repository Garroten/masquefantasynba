class Steal < ActiveRecord::Base
  belongs_to :player
  attr_accessible :GP, :MPG, :PF, :STL, :STP48M, :STPG, :ST_TF, :ST_TO, :TOPG, :T_O, :day, :id, :month, :player_id, :season, :year
  
  def self.all_season
    Steal.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(STL) AS STL, SUM(STL)/SUM(GP) AS STPG FROM steals GROUP BY player_id")
  end  
  
  def self.day_before
    Steal.find_by_sql("SELECT * FROM steals WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW())")
  end
  
  def self.five_days_before
    Steal.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(STL) AS STL, SUM(STL)/SUM(GP) AS STPG FROM steals WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.ten_days_before
    Steal.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(STL) AS STL, SUM(STL)/SUM(GP) AS STPG FROM steals WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.stl_season_by_player(player_id)
    Steal.find_by_sql("SELECT SUM(STL) AS STL FROM steals WHERE player_id = " + player_id.to_s)
  end
  
  def self.stl_day_before_by_player(player_id)
    Steal.find_by_sql("SELECT SUM(STL) AS STL FROM steals WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
  
  def self.stl_five_days_before_by_player(player_id)
    Steal.find_by_sql("SELECT SUM(STL) AS STL FROM steals WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
  
  def self.stl_ten_days_before_by_player(player_id)
    Steal.find_by_sql("SELECT SUM(STL) AS STL FROM steals WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
end
