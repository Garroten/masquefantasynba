class Score < ActiveRecord::Base
  belongs_to :player
  attr_accessible :_3P, :_3PA, :_3PM, :FG, :FGA, :FGM, :FT, :FTA, :FTM, :GP, :MPG, :PTS, :day, :id, :month, :player_id, :season, :year
  
  def self.all_season
    Score.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(PTS) AS PTS, SUM(PTS)/SUM(GP) AS PTPG FROM scores GROUP BY player_id")
  end  
  
  def self.day_before
    Score.find_by_sql("SELECT * FROM scores WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW())")
  end
  
  def self.five_days_before
    Score.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(PTS) AS PTS, SUM(PTS)/SUM(GP) AS PTPG FROM scores WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.ten_days_before
    Score.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(PTS) AS PTS, SUM(PTS)/SUM(GP) AS PTPG FROM scores WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
end
