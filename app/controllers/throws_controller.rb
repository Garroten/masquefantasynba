require 'will_paginate/array'
class ThrowsController < ApplicationController
  before_filter :get_leaders
  # GET /trhows
  # GET /trhows.json
  def index
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new            
      fg = Score.fg_season_by_player(p.id)[0].FGA
      if fg.nil?        
        next
      else  
        fantasy.fg = (-1 * fg)
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
  
  # GET /trhows/daybefore
  # GET /trhows/daybefore.json
  def daybefore
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      fg = Score.fg_day_before_by_player(p.id)[0].FGA
      if fg.nil?        
        next
      else  
        fantasy.fg = (-1 * fg)
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
  
  # GET /trhows/fivedaysbefore
  # GET /trhows/fivedaysbefore.json
  def fivedaysbefore
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      fg = Score.fg_five_days_before_by_player(p.id)[0].FGA
      if fg.nil?        
        next
      else  
        fantasy.fg = (-1 * fg)
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
  
  # GET /trhows/tendaysbefore
  # GET /trhows/tendaysbefore.json
  def tendaysbefore
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new    
      fg = Score.fg_ten_days_before_by_player(p.id)[0].FGA
      if fg.nil?        
        next
      else  
        fantasy.fg = (-1 * fg)
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
      fg = Score.fg_season_by_player(p.id)[0].FGA
      if fg.nil?        
        next
      else  
        fantasy.fg = (-1 * fg)
      end                  
      
      gp = Score.gp_season_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      fantasy.rank = fantasy.fg / fantasy.gp
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - 5)
  end
end
