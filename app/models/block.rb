class Block < ActiveRecord::Base
  belongs_to :player
  attr_accessible :BLK, :BLKP48M, :BLKPG, :BLK_PF, :GP, :MPG, :PF, :day, :id, :month, :player_id, :season, :year    
  
  def self.all_season
    Block.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(BLK) AS BLK, SUM(BLK)/SUM(GP) AS BLKPG FROM blocks GROUP BY player_id")
  end  
  
  def self.day_before
    Block.find_by_sql("SELECT * FROM blocks WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW())")
  end
  
  def self.five_days_before
    Block.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(BLK) AS BLK, SUM(BLK)/SUM(GP) AS BLKPG FROM blocks WHERE day > DAY(NOW())-5 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
  
  def self.ten_days_before
    Block.find_by_sql("SELECT player_id, SUM(GP) AS GP, SUM(BLK) AS BLK, SUM(BLK)/SUM(GP) AS BLKPG FROM blocks WHERE day > DAY(NOW())-10 AND month = MONTH(NOW()) AND year = YEAR(NOW()) GROUP BY player_id")
  end 
end
 