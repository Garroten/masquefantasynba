class Foul < ActiveRecord::Base
  belongs_to :player
  attr_accessible :GP, :MPG, :PF, :PFP48M, :PFPG, :day, :eject, :id, :month, :player_id, :season, :year
  
  def self.all_season
    Foul.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(PF) AS PF, SUM(PF)/SUM(GP) AS PFPG FROM fouls GROUP BY player_id")
  end  
  
  def self.day_before
    Foul.find_by_sql("SELECT * FROM fouls WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW())")
  end
  
  def self.five_days_before
    Foul.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(PF) AS PF, SUM(PF)/SUM(GP) AS PFPG FROM fouls WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.ten_days_before
    Foul.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(PF) AS PF, SUM(PF)/SUM(GP) AS PFPG FROM fouls WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end
  
  def self.pf_season_by_player(player_id)
    Foul.find_by_sql("SELECT SUM(PF) AS PF FROM fouls WHERE player_id = " + player_id.to_s)
  end
  
  def self.pf_day_before_by_player(player_id)
    Foul.find_by_sql("SELECT SUM(PF) AS PF FROM fouls WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
  
  def self.pf_five_days_before_by_player(player_id)
    Foul.find_by_sql("SELECT SUM(PF) AS PF FROM fouls WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
  
  def self.pf_ten_days_before_by_player(player_id)
    Foul.find_by_sql("SELECT SUM(PF) AS PF FROM fouls WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
end
