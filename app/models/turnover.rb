class Turnover < ActiveRecord::Base
  belongs_to :player
  attr_accessible :AST_TO, :GP, :MPG, :STL_TO, :TO48, :TOPG, :T_O, :day, :id, :month, :player_id, :season, :year
  
  def self.all_season
    Turnover.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(T_O) AS T_O, SUM(T_O)/SUM(GP) AS TOPG FROM turnovers GROUP BY player_id")
  end  
  
  def self.day_before
    Turnover.find_by_sql("SELECT * FROM turnovers WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW())")
  end
  
  def self.five_days_before
    Turnover.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(T_O) AS T_O, SUM(T_O)/SUM(GP) AS TOPG FROM turnovers WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.ten_days_before
    Turnover.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(T_O) AS T_O, SUM(T_O)/SUM(GP) AS TOPG FROM turnovers WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end
  
  def self.to_season_by_player(player_id)
    Turnover.find_by_sql("SELECT SUM(T_O) AS T_O FROM turnovers WHERE player_id = " + player_id.to_s)
  end 
  
  def self.to_day_before_by_player(player_id)
    Turnover.find_by_sql("SELECT SUM(T_O) AS T_O FROM turnovers WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
  
  def self.to_five_days_before_by_player(player_id)
    Turnover.find_by_sql("SELECT SUM(T_O) AS T_O FROM turnovers WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
  
  def self.to_ten_days_before_by_player(player_id)
    Turnover.find_by_sql("SELECT SUM(T_O) AS T_O FROM turnovers WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
end
