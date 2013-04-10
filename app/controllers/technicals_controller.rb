require 'will_paginate/array'
class TechnicalsController < ApplicationController
  before_filter :get_leaders
  # GET /technicals
  # GET /technicals.json
  def index
    #@technicals = Technical.all
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      tf = Technical.tf_season_by_player(p.id)[0].TF
      if tf.nil?        
        next
      else  
        fantasy.tf = (-2 * tf)
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
  
  # GET /technicals/daybefore
  def daybefore         
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      tf = Technical.tf_day_before_by_player(p.id)[0].TF
      if tf.nil?        
        next
      else  
        fantasy.tf = (-2 * tf)
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
  
  # GET /technicals/fivedaysbefore
  def fivedaysbefore
    #@blocks = Block.five_days_before.paginate(:page => params[:page], :per_page => 10)  
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      tf = Technical.tf_five_days_before_by_player(p.id)[0].TF
      if tf.nil?        
        next
      else  
        fantasy.tf = (-2 * tf)
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
  
  # GET /technicals/tendaysbefore
  def tendaysbefore    
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      tf = Technical.tf_ten_days_before_by_player(p.id)[0].TF
      if tf.nil?        
        next
      else  
        fantasy.tf = (-2 * tf)
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
  
  # GET /technicals/1
  # GET /technicals/1.json
  def show
    @technical = Technical.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @technical }
    end
  end

  # GET /technicals/new
  # GET /technicals/new.json
  def new
    @technical = Technical.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @technical }
    end
  end

  # GET /technicals/1/edit
  def edit
    @technical = Technical.find(params[:id])
  end

  # POST /technicals
  # POST /technicals.json
  def create
    @technical = Technical.new(params[:technical])

    respond_to do |format|
      if @technical.save
        format.html { redirect_to @technical, :notice => 'Technical was successfully created.' }
        format.json { render :json => @technical, :status => :created, :location => @technical }
      else
        format.html { render :action => "new" }
        format.json { render :json => @technical.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /technicals/1
  # PUT /technicals/1.json
  def update
    @technical = Technical.find(params[:id])

    respond_to do |format|
      if @technical.update_attributes(params[:technical])
        format.html { redirect_to @technical, :notice => 'Technical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @technical.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /technicals/1
  # DELETE /technicals/1.json
  def destroy
    @technical = Technical.find(params[:id])
    @technical.destroy

    respond_to do |format|
      format.html { redirect_to technicals_url }
      format.json { head :no_content }
    end
  end
  
  def get_leaders
    @players_found = Player.all  
    @players = Array.new
    @players_found.each { |p|  
      fantasy = Fantasy.new
      tf = Technical.tf_season_by_player(p.id)[0].TF
      if tf.nil?        
        next
      else  
        fantasy.tf = (-2 * tf)
      end
      
      gp = Score.gp_season_by_player(p.id)[0].GP
      
      if gp.nil?        
        next
      else  
        fantasy.gp = gp
      end
      fantasy.rank = fantasy.tf / fantasy.gp
      p.fantasy = fantasy 
      @players.push(p)     
    }    
    
    @players.sort! { |a,b| a.fantasy.rank <=> b.fantasy.rank }    
    @playerss = @players.drop(@players.length - 5)
  end
end
