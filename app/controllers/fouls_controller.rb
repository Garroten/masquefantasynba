require 'will_paginate/array'
class FoulsController < ApplicationController
  before_filter :get_leaders
  # GET /fouls
  # GET /fouls.json
  def index
    #@fouls = Foul.all_season.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      pf = Foul.pf_season_by_player(p.id)[0].PF
      if pf.nil?        
        next
      else  
        fantasy.pf = (-1 * pf)
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
  
  # GET /fouls/daybefore
  # GET /fouls/daybefore.json
  def daybefore
    #@fouls = Foul.day_before.paginate(:page => params[:page], :per_page => 10)      
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      pf = Foul.pf_day_before_by_player(p.id)[0].PF
      if pf.nil?        
        next
      else  
        fantasy.pf = (-1 * pf)
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
  
  # GET /fouls/fivedaysbefore
  # GET /fouls/fivedaysbefore.json
  def fivedaysbefore
    #@fouls = Foul.five_days_before.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      pf = Foul.pf_five_days_before_by_player(p.id)[0].PF
      if pf.nil?        
        next
      else  
        fantasy.pf = (-1 * pf)
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
  
  # GET /fouls/tendaysbefore
  # GET /fouls/tendaysbefore.json
  def tendaysbefore
    #@fouls = Foul.ten_days_before.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      pf = Foul.pf_ten_days_before_by_player(p.id)[0].PF
      if pf.nil?        
        next
      else  
        fantasy.pf = (-1 * pf)
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

  # GET /fouls/1
  # GET /fouls/1.json
  def show
    @foul = Foul.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @foul }
    end
  end

  # GET /fouls/new
  # GET /fouls/new.json
  def new
    @foul = Foul.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @foul }
    end
  end

  # GET /fouls/1/edit
  def edit
    @foul = Foul.find(params[:id])
  end

  # POST /fouls
  # POST /fouls.json
  def create
    @foul = Foul.new(params[:foul])

    respond_to do |format|
      if @foul.save
        format.html { redirect_to @foul, :notice => 'Foul was successfully created.' }
        format.json { render :json => @foul, :status => :created, :location => @foul }
      else
        format.html { render :action => "new" }
        format.json { render :json => @foul.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fouls/1
  # PUT /fouls/1.json
  def update
    @foul = Foul.find(params[:id])

    respond_to do |format|
      if @foul.update_attributes(params[:foul])
        format.html { redirect_to @foul, :notice => 'Foul was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @foul.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fouls/1
  # DELETE /fouls/1.json
  def destroy
    @foul = Foul.find(params[:id])
    @foul.destroy

    respond_to do |format|
      format.html { redirect_to fouls_url }
      format.json { head :no_content }
    end
  end
  
  def get_leaders
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      pf = Foul.pf_season_by_player(p.id)[0].PF
      if pf.nil?        
        next
      else  
        fantasy.pf = (-1 * pf)
      end
      gp = Score.gp_season_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      fantasy.rank = fantasy.pf / fantasy.gp
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - 5)
  end
end
