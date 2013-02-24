class Rebound < ActiveRecord::Base
  belongs_to :player
  attr_accessible :DEF, :DRPG, :GP, :MPG, :OFF, :ORPG, :REB, :RP40, :RPG, :day, :id, :month, :player_id, :season, :year
  
  def self.all_season
    Rebound.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(REB) AS REB, SUM(REB)/SUM(GP) AS RPG FROM rebounds GROUP BY player_id")
  end  
  
  def self.day_before
    Rebound.find_by_sql("SELECT * FROM rebounds WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW())")
  end
  
  def self.five_days_before
    Rebound.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(REB) AS REB, SUM(REB)/SUM(GP) AS RPG FROM rebounds WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.ten_days_before
    Rebound.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(REB) AS REB, SUM(REB)/SUM(GP) AS RPG FROM rebounds WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
end
