class Fantasy
  
  attr_reader :pts, :reb, :ast, :to, :blk, :fg, :pf, :stl, :tf, :gp, :rank
  attr_accessor :pts, :reb, :ast, :to, :blk, :fg, :pf, :stl, :tf, :gp, :rank
  
  def initialize    
  end
  
  def total    
    return (pts + reb + ast + (to * 2) + (blk * 2) + (-1 * fg) + (-1 * pf) + (-2 * stl) + (-2 * tf)) / gp
  end
  
end
