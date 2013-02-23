class Block < ActiveRecord::Base
  belongs_to :player
  attr_accessible :BLK, :BLKP48M, :BLKPG, :BLK_PF, :GP, :MPG, :PF, :day, :id, :month, :player_id, :season, :year
  
  def self.day_before
    Block.find_by_sql("SELECT * FROM blocks WHERE day = DAY(NOW())-1 AND month = MONTH(NOW()) AND year = YEAR(NOW())")
  end
end
 