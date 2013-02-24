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
end
