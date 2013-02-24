require 'will_paginate/array'
class StealsController < ApplicationController
  # GET /steals
  # GET /steals.json
  def index
    @steals = Steal.all_season.paginate(:page => params[:page], :per_page => 10)  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @steals }
    end
  end

  # GET /steals/daybefore
  # GET /steals/daybefore.json
  def daybefore
    @steals = Steal.day_before.paginate(:page => params[:page], :per_page => 10)      

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @steals }
    end
  end
  
  # GET /steals/fivedaysbefore
  # GET /steals/fivedaysbefore.json
  def fivedaysbefore
    @steals = Steal.five_days_before.paginate(:page => params[:page], :per_page => 10)  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @steals }
    end
  end
  
  # GET /steals/tendaysbefore
  # GET /steals/tendaysbefore.json
  def tendaysbefore
    @steals = Steal.ten_days_before.paginate(:page => params[:page], :per_page => 10)  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @steals }
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
end
