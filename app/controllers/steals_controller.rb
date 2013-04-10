require 'will_paginate/array'
class StealsController < ApplicationController
  before_filter :get_leaders
  # GET /steals
  # GET /steals.json
  def index
    #@steals = Steal.all_season.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      stl = Steal.stl_season_by_player(p.id)[0].STL
      if stl.nil?        
        next
      else  
        fantasy.stl = (-2 * stl)
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

  # GET /steals/daybefore
  # GET /steals/daybefore.json
  def daybefore
    #@steals = Steal.day_before.paginate(:page => params[:page], :per_page => 10)      
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      stl = Steal.stl_day_before_by_player(p.id)[0].STL
      if stl.nil?        
        next
      else  
        fantasy.stl = (-2 * stl)
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
  
  # GET /steals/fivedaysbefore
  # GET /steals/fivedaysbefore.json
  def fivedaysbefore
    #@steals = Steal.five_days_before.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      stl = Steal.stl_five_days_before_by_player(p.id)[0].STL
      if stl.nil?        
        next
      else  
        fantasy.stl = (-2 * stl)
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
  
  # GET /steals/tendaysbefore
  # GET /steals/tendaysbefore.json
  def tendaysbefore
    #@steals = Steal.ten_days_before.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      stl = Steal.stl_ten_days_before_by_player(p.id)[0].STL
      if stl.nil?        
        next
      else  
        fantasy.stl = (-2 * stl)
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
  
  # GET /steals/1
  # GET /steals/1.json
  def show
    @steal = Steal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @steal }
    end
  end

  # GET /steals/new
  # GET /steals/new.json
  def new
    @steal = Steal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @steal }
    end
  end

  # GET /steals/1/edit
  def edit
    @steal = Steal.find(params[:id])
  end

  # POST /steals
  # POST /steals.json
  def create
    @steal = Steal.new(params[:steal])

    respond_to do |format|
      if @steal.save
        format.html { redirect_to @steal, :notice => 'Steal was successfully created.' }
        format.json { render :json => @steal, :status => :created, :location => @steal }
      else
        format.html { render :action => "new" }
        format.json { render :json => @steal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /steals/1
  # PUT /steals/1.json
  def update
    @steal = Steal.find(params[:id])

    respond_to do |format|
      if @steal.update_attributes(params[:steal])
        format.html { redirect_to @steal, :notice => 'Steal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @steal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /steals/1
  # DELETE /steals/1.json
  def destroy
    @steal = Steal.find(params[:id])
    @steal.destroy

    respond_to do |format|
      format.html { redirect_to steals_url }
      format.json { head :no_content }
    end
  end
  
  def get_leaders
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      stl = Steal.stl_season_by_player(p.id)[0].STL
      if stl.nil?        
        next
      else  
        fantasy.stl = (-2 * stl)
      end
      gp = Score.gp_season_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      fantasy.rank = fantasy.stl / fantasy.gp
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - 5)
  end
end
