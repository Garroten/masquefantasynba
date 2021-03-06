require 'will_paginate/array'
class ReboundsController < ApplicationController
  before_filter :get_leaders
  # GET /rebounds
  # GET /rebounds.json
  def index
    #@rebounds = Rebound.all_season.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      reb = Rebound.reb_season_by_player(p.id)[0].REB
      if reb.nil?         
        next
      else 
        fantasy.reb = reb
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
  
  # GET /rebounds/daybefore
  # GET /rebounds/daybefore.json
  def daybefore
    #@rebounds = Rebound.day_before.paginate(:page => params[:page], :per_page => 10)      
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      reb = Rebound.reb_day_before_by_player(p.id)[0].REB
      if reb.nil?         
        next
      else 
        fantasy.reb = reb
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
  
  # GET /rebounds/fivedaysbefore
  # GET /rebounds/fivedaysbefore.json
  def fivedaysbefore
    #@rebounds = Rebound.five_days_before.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      reb = Rebound.reb_five_days_before_by_player(p.id)[0].REB
      if reb.nil?         
        next
      else 
        fantasy.reb = reb
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
  
  # GET /rebounds/tendaysbefore
  # GET /rebounds/tendaysbefore.json
  def tendaysbefore
    #@rebounds = Rebound.ten_days_before.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      reb = Rebound.reb_ten_days_before_by_player(p.id)[0].REB
      if reb.nil?         
        next
      else 
        fantasy.reb = reb
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

  # GET /rebounds/1
  # GET /rebounds/1.json
  def show
    @rebound = Rebound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rebound }
    end
  end

  # GET /rebounds/new
  # GET /rebounds/new.json
  def new
    @rebound = Rebound.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @rebound }
    end
  end

  # GET /rebounds/1/edit
  def edit
    @rebound = Rebound.find(params[:id])
  end

  # POST /rebounds
  # POST /rebounds.json
  def create
    @rebound = Rebound.new(params[:rebound])

    respond_to do |format|
      if @rebound.save
        format.html { redirect_to @rebound, :notice => 'Rebound was successfully created.' }
        format.json { render :json => @rebound, :status => :created, :location => @rebound }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rebound.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rebounds/1
  # PUT /rebounds/1.json
  def update
    @rebound = Rebound.find(params[:id])

    respond_to do |format|
      if @rebound.update_attributes(params[:rebound])
        format.html { redirect_to @rebound, :notice => 'Rebound was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @rebound.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rebounds/1
  # DELETE /rebounds/1.json
  def destroy
    @rebound = Rebound.find(params[:id])
    @rebound.destroy

    respond_to do |format|
      format.html { redirect_to rebounds_url }
      format.json { head :no_content }
    end
  end
  
  def get_leaders
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      reb = Rebound.reb_season_by_player(p.id)[0].REB
      if reb.nil?         
        next
      else 
        fantasy.reb = reb
      end     
      gp = Score.gp_season_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      fantasy.rank = fantasy.reb / fantasy.gp
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - 5)
  end
end
