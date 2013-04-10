class Assist < ActiveRecord::Base
  belongs_to :player
  attr_accessible :AP48M, :APG, :AST, :AST_TO, :GP, :MPG, :TOPG, :T_O, :day, :id, :month, :season, :year
  
  def self.all_season
    Assist.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(AST) AS AST, SUM(AST)/SUM(GP) AS ASTPG FROM assists GROUP BY player_id")
  end  
  
  def self.day_before
    Assist.find_by_sql("SELECT * FROM assists WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW())")
  end
  
  def self.five_days_before
    Assist.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(AST) AS AST, SUM(AST)/SUM(GP) AS ASTPG FROM assists WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.ten_days_before
    Assist.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(AST) AS AST, SUM(AST)/SUM(GP) AS ASTPG FROM assists WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.ast_season_by_player(player_id)
    Assist.find_by_sql("SELECT SUM(AST) AS AST FROM assists WHERE player_id = " + player_id.to_s)
  end
  
  def self.ast_day_before_by_player(player_id)
    Assist.find_by_sql("SELECT SUM(AST) AS AST FROM assists WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
  
  def self.ast_five_days_before_by_player(player_id)
    Assist.find_by_sql("SELECT SUM(AST) AS AST FROM assists WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
  
  def self.ast_ten_days_before_by_player(player_id)
    Assist.find_by_sql("SELECT SUM(AST) AS AST FROM assists WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) AND player_id = " + player_id.to_s)
  end
end
