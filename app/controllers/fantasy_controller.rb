require 'will_paginate/array'
class FantasyController < ApplicationController
  before_filter :get_leaders
  # GET /fantasy
  # GET /fantasy.json
  def index
    @players_found = Player.all  
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
    
    @players = @players.paginate(:page => params[:page], :per_page => 10)  
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @players }
    end
  end
  
  # GET /fantasy/daybefore
  # GET /fantasy/daybefore.json
  def daybefore
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      pts = Score.pts_day_before_by_player(p.id)[0].PTS            
      if pts.nil?                                 
        next
      else         
        fantasy.pts = pts
      end
      
      reb = Rebound.reb_day_before_by_player(p.id)[0].REB
      if reb.nil?         
        next
      else 
        fantasy.reb = reb
      end      
      
      ast = Assist.ast_day_before_by_player(p.id)[0].AST
      if ast.nil?         
        next
      else 
        fantasy.ast = ast
      end  

      to = Turnover.to_day_before_by_player(p.id)[0].T_O
      if to.nil?        
        next
      else  
        fantasy.to = to
      end
      
      blk = Block.blk_day_before_by_player(p.id)[0].BLK
      if blk.nil?        
        next
      else  
        fantasy.blk = blk
      end
      
      fg = Score.fg_day_before_by_player(p.id)[0].FGA
      if fg.nil?        
        next
      else  
        fantasy.fg = fg
      end
            
      pf = Foul.pf_day_before_by_player(p.id)[0].PF
      if pf.nil?        
        next
      else  
        fantasy.pf = pf
      end
      
      stl = Steal.stl_day_before_by_player(p.id)[0].STL
      if stl.nil?        
        next
      else  
        fantasy.stl = stl
      end
      
      tf = Technical.tf_day_before_by_player(p.id)[0].TF
      if tf.nil?        
        next
      else  
        fantasy.tf = tf
      end
      
      gp = Score.gp_day_before_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players = @players.paginate(:page => params[:page], :per_page => 10)  
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @players }
    end
  end
  
  # GET /fantasy/fivedaysbefore
  # GET /fantasy/fivedaysbefore.json
  def fivedaysbefore
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      pts = Score.pts_five_days_before_by_player(p.id)[0].PTS            
      if pts.nil?                                 
        next
      else         
        fantasy.pts = pts
      end
      
      reb = Rebound.reb_five_days_before_by_player(p.id)[0].REB
      if reb.nil?         
        next
      else 
        fantasy.reb = reb
      end      
      
      ast = Assist.ast_five_days_before_by_player(p.id)[0].AST
      if ast.nil?         
        next
      else 
        fantasy.ast = ast
      end  

      to = Turnover.to_five_days_before_by_player(p.id)[0].T_O
      if to.nil?        
        next
      else  
        fantasy.to = to
      end
      
      blk = Block.blk_five_days_before_by_player(p.id)[0].BLK
      if blk.nil?        
        next
      else  
        fantasy.blk = blk
      end
      
      fg = Score.fg_five_days_before_by_player(p.id)[0].FGA
      if fg.nil?        
        next
      else  
        fantasy.fg = fg
      end
            
      pf = Foul.pf_five_days_before_by_player(p.id)[0].PF
      if pf.nil?        
        next
      else  
        fantasy.pf = pf
      end
      
      stl = Steal.stl_five_days_before_by_player(p.id)[0].STL
      if stl.nil?        
        next
      else  
        fantasy.stl = stl
      end
      
      tf = Technical.tf_five_days_before_by_player(p.id)[0].TF
      if tf.nil?        
        next
      else  
        fantasy.tf = tf
      end
      
      gp = Score.gp_five_days_before_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players = @players.paginate(:page => params[:page], :per_page => 10)  
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @players }
    end
  end
  
  # GET /fantasy/tendaysbefore
  # GET /fantasy/tendaysbefore.json
  def tendaysbefore
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      pts = Score.pts_ten_days_before_by_player(p.id)[0].PTS            
      if pts.nil?                                 
        next
      else         
        fantasy.pts = pts
      end
      
      reb = Rebound.reb_ten_days_before_by_player(p.id)[0].REB
      if reb.nil?         
        next
      else 
        fantasy.reb = reb
      end      
      
      ast = Assist.ast_ten_days_before_by_player(p.id)[0].AST
      if ast.nil?         
        next
      else 
        fantasy.ast = ast
      end  

      to = Turnover.to_ten_days_before_by_player(p.id)[0].T_O
      if to.nil?        
        next
      else  
        fantasy.to = to
      end
      
      blk = Block.blk_ten_days_before_by_player(p.id)[0].BLK
      if blk.nil?        
        next
      else  
        fantasy.blk = blk
      end
      
      fg = Score.fg_ten_days_before_by_player(p.id)[0].FGA
      if fg.nil?        
        next
      else  
        fantasy.fg = fg
      end
            
      pf = Foul.pf_ten_days_before_by_player(p.id)[0].PF
      if pf.nil?        
        next
      else  
        fantasy.pf = pf
      end
      
      stl = Steal.stl_ten_days_before_by_player(p.id)[0].STL
      if stl.nil?        
        next
      else  
        fantasy.stl = stl
      end
      
      tf = Technical.tf_ten_days_before_by_player(p.id)[0].TF
      if tf.nil?        
        next
      else  
        fantasy.tf = tf
      end
      
      gp = Score.gp_ten_days_before_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players = @players.paginate(:page => params[:page], :per_page => 10)  
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @players }
    end
  end
  
  def get_leaders
    @players_found = Player.all  
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
      
      fantasy.rank = fantasy.total
      
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }
    
    @playerss = @players.drop(@players.length - 5)
    
  end
  
end
