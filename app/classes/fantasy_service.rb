class FantasyService
  attr_reader :players_found, :players, :nro
  attr_accessor :players_found, :players, :nro
  
  def initialize    
    @players_found = Player.all  
    @players = get_players
    @nro = 5
  end
  
  def score_leaders
    @players.each { |p|        
      p.fantasy.rank = p.fantasy.pts / p.fantasy.gp  
    }        
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)
    return @playerss
  end
  
  def assists_leaders
    @players.each { |p|  
      p.fantasy.rank = p.fantasy.ast / p.fantasy.gp   
    }        
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)
    return @playerss
  end
  
  def rebounds_leaders
    @players.each { |p|        
      p.fantasy.rank = p.fantasy.reb / p.fantasy.gp   
    }        
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)
    return @playerss
  end
  
  def steals_leaders    
    @players.each { |p|        
      p.fantasy.rank = p.fantasy.stl / p.fantasy.gp       
    }        
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)
    return @playerss
  end
  
  def blocks_leaders
    @players.each { |p|        
      p.fantasy.rank = p.fantasy.blk / p.fantasy.gp      
    }        
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)
    return @playerss
  end
  
  def fouls_leaders
    @players.each { |p|  
      p.fantasy.rank = p.fantasy.pf / p.fantasy.gp      
    }        
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)
    return @playerss
  end
  
  def turnovers_leaders
    @players.each { |p|        
      p.fantasy.rank = p.fantasy.to / p.fantasy.gp    
    }    
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)
  end
  
  def technicals_leaders
    @players.each { |p|        
      p.fantasy.rank = p.fantasy.tf / p.fantasy.gp      
    }        
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)
    return @playerss   
  end
  
  def throws_leaders
    @players.each { |p|        
      p.fantasy.rank = p.fantasy.fg / p.fantasy.gp      
    }        
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)
  end
  
  def fantsy_leaders    
    @players.each { |p|              
      p.fantasy.rank = p.fantasy.total     
    }        
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - @nro)    
    return @playerss
  end
  
  def get_players
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      pts = Score.pts_season_by_player(p.id)[0].PTS            
      if pts.nil?                                 
        next
      else         
        fantasy.pts = pts
      end
      
      reb = Rebound.reb_season_by_player(p.id)[0].REB
      if reb.nil?         
        next
      else 
        fantasy.reb = reb
      end      
      
      ast = Assist.ast_season_by_player(p.id)[0].AST
      if ast.nil?         
        next
      else 
        fantasy.ast = ast
      end  

      to = Turnover.to_season_by_player(p.id)[0].T_O
      if to.nil?        
        next
      else  
        fantasy.to = to
      end
      
      blk = Block.blk_season_by_player(p.id)[0].BLK
      if blk.nil?        
        next
      else  
        fantasy.blk = blk
      end
      
      fg = Score.fg_season_by_player(p.id)[0].FGA
      if fg.nil?        
        next
      else  
        fantasy.fg = fg
      end
            
      pf = Foul.pf_season_by_player(p.id)[0].PF
      if pf.nil?        
        next
      else  
        fantasy.pf = pf
      end
      
      stl = Steal.stl_season_by_player(p.id)[0].STL
      if stl.nil?        
        next
      else  
        fantasy.stl = stl
      end
      
      tf = Technical.tf_season_by_player(p.id)[0].TF
      if tf.nil?        
        next
      else  
        fantasy.tf = tf
      end
      
      gp = Score.gp_season_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end            
      
      p.fantasy = fantasy 
      @players.push(p)     
    }    
        
    return @players
  end
end
