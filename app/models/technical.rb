class Technical < ActiveRecord::Base
  attr_accessible :DIV, :DQ, :FF, :GP, :GS, :P, :PF, :TF, :day, :id, :month, :player_id, :season, :year
  
  def self.all_season
    Technical.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(TF) AS TF, SUM(TF)/SUM(GP) AS TFPG FROM technicals GROUP BY player_id")
  end  
  
  def self.day_before
    Technical.find_by_sql("SELECT * FROM technicals WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW())")
  end
  
  def self.five_days_before
    Technical.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(TF) AS TF, SUM(TF)/SUM(GP) AS TFPG FROM technicals WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.ten_days_before
    Technical.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(TF) AS TF, SUM(TF)/SUM(GP) AS TFPG FROM technicals WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.tf_season_by_player(player_id)
    logger.debug DateHelper.fantasy_days
    Technical.find_by_sql("SELECT SUM(TF) AS TF FROM technicals WHERE player_id = " + player_id.to_s)
  end 
  
  def self.tf_day_before_by_player(player_id)
    Technical.find_by_sql("SELECT SUM(TF) AS TF FROM technicals WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end 
  
  def self.tf_five_days_before_by_player(player_id)
    Technical.find_by_sql("SELECT SUM(TF) AS TF FROM technicals WHERE day = DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end 
  
  def self.tf_ten_days_before_by_player(player_id)
    Technical.find_by_sql("SELECT SUM(TF) AS TF FROM technicals WHERE day = DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end 
end
