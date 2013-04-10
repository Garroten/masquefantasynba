require 'will_paginate/array'
class ScoresController < ApplicationController
  before_filter :get_leaders
  # GET /scores
  # GET /scores.json
  def index
    #@scores = Score.all_season.paginate(:page => params[:page], :per_page => 10)  
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
      #format.json { render :json => @scores }
      format.json { render :json => @players }
    end
  end

  # GET /scores/daybefore
  # GET /scores/daybefore.json
  def daybefore
    #@scores = Score.day_before.paginate(:page => params[:page], :per_page => 10)     
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
  
  # GET /scores/fivedaysbefore
  # GET /scores/fivedaysbefore.json
  def fivedaysbefore
    #@scores = Score.five_days_before.paginate(:page => params[:page], :per_page => 10)  
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
  
  # GET /scores/tendaysbefore
  # GET /scores/tendaysbefore.json
  def tendaysbefore
    #@scores = Score.ten_days_before.paginate(:page => params[:page], :per_page => 10)  
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
  
  # GET /scores/1
  # GET /scores/1.json
  def show
    @score = Score.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @score }
    end
  end

  # GET /scores/new
  # GET /scores/new.json
  def new
    @score = Score.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @score }
    end
  end

  # GET /scores/1/edit
  def edit
    @score = Score.find(params[:id])
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(params[:score])

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, :notice => 'Score was successfully created.' }
        format.json { render :json => @score, :status => :created, :location => @score }
      else
        format.html { render :action => "new" }
        format.json { render :json => @score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scores/1
  # PUT /scores/1.json
  def update
    @score = Score.find(params[:id])

    respond_to do |format|
      if @score.update_attributes(params[:score])
        format.html { redirect_to @score, :notice => 'Score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score = Score.find(params[:id])
    @score.destroy

    respond_to do |format|
      format.html { redirect_to scores_url }
      format.json { head :no_content }
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
      gp = Score.gp_season_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      fantasy.rank = fantasy.pts / fantasy.gp
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - 5)
#    fantasy_service = FantasyService.new
#    @playerss = fantasy_service.score_leaders
  end
end
