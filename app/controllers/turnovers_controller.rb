require 'will_paginate/array'
class TurnoversController < ApplicationController
  before_filter :get_leaders
  # GET /turnovers
  # GET /turnovers.json
  def index
    #@turnovers = Turnover.all_season.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      to = Turnover.to_season_by_player(p.id)[0].T_O
      if to.nil?        
        next
      else  
        fantasy.to = (to * 2)
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

  # GET /turnovers/daybefore
  # GET /turnovers/daybefore.json
  def daybefore
    #@turnovers = Turnover.day_before.paginate(:page => params[:page], :per_page => 10)      
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      to = Turnover.to_day_before_by_player(p.id)[0].T_O
      if to.nil?        
        next
      else  
        fantasy.to = (to * 2)
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
  
  # GET /turnovers/fivedaysbefore
  # GET /turnovers/fivedaysbefore.json
  def fivedaysbefore
    #@turnovers = Turnover.five_days_before.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      to = Turnover.to_five_days_before_by_player(p.id)[0].T_O
      if to.nil?        
        next
      else  
        fantasy.to = (to * 2)
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
  
  # GET /turnovers/tendaysbefore
  # GET /turnovers/tendaysbefore.json
  def tendaysbefore
    #@turnovers = Turnover.ten_days_before.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      to = Turnover.to_ten_days_before_by_player(p.id)[0].T_O
      if to.nil?        
        next
      else  
        fantasy.to = (to * 2)
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
  
  # GET /turnovers/1
  # GET /turnovers/1.json
  def show
    @turnover = Turnover.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @turnover }
    end
  end

  # GET /turnovers/new
  # GET /turnovers/new.json
  def new
    @turnover = Turnover.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @turnover }
    end
  end

  # GET /turnovers/1/edit
  def edit
    @turnover = Turnover.find(params[:id])
  end

  # POST /turnovers
  # POST /turnovers.json
  def create
    @turnover = Turnover.new(params[:turnover])

    respond_to do |format|
      if @turnover.save
        format.html { redirect_to @turnover, :notice => 'Turnover was successfully created.' }
        format.json { render :json => @turnover, :status => :created, :location => @turnover }
      else
        format.html { render :action => "new" }
        format.json { render :json => @turnover.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /turnovers/1
  # PUT /turnovers/1.json
  def update
    @turnover = Turnover.find(params[:id])

    respond_to do |format|
      if @turnover.update_attributes(params[:turnover])
        format.html { redirect_to @turnover, :notice => 'Turnover was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @turnover.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /turnovers/1
  # DELETE /turnovers/1.json
  def destroy
    @turnover = Turnover.find(params[:id])
    @turnover.destroy

    respond_to do |format|
      format.html { redirect_to turnovers_url }
      format.json { head :no_content }
    end
  end
  
  def get_leaders
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      to = Turnover.to_season_by_player(p.id)[0].T_O
      if to.nil?        
        next
      else  
        fantasy.to = (to * 2)
      end
      gp = Score.gp_season_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      fantasy.rank = fantasy.to / fantasy.gp
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - 5)
  end
end
