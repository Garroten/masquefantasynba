class DateHelper
  def initialize  
  end
  
  def self.fantasy_days
    date = Date.today()
    day = date.wday
    case date.wday
      when 0
        return -3
      when 1
        return -4
      when 2
        return -5
      when 3
        return -6
      when 4
        return -7
      when 5 
        return -1
      when 6
        return -2
    end    
  end
  
  def self.where_clause(type)
    
  end
end
