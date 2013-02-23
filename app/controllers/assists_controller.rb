require 'will_paginate/array'
class AssistsController < ApplicationController
  # GET /assists
  # GET /assists.json
  def index
    @assists = Assist.all_season.paginate(:page => params[:page], :per_page => 10) 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @assists }
    end
  end

  # GET /assists/daybefore
  def daybefore
    @assists = Assist.day_before.paginate(:page => params[:page], :per_page => 10)     

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @blocks }
    end
  end
  
  # GET /assists/fivedaysbefore
  def fivedaysbefore
    @assists = Assist.five_days_before.paginate(:page => params[:page], :per_page => 10)  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @blocks }
    end
  end
  
  # GET /assists/tendaysbefore
  def tendaysbefore
    @assists = Assist.ten_days_before.paginate(:page => params[:page], :per_page => 10)  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @blocks }
    end
  end
  
  # GET /assists/1
  # GET /assists/1.json
  def show
    @assist = Assist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @assist }
    end
  end

  # GET /assists/new
  # GET /assists/new.json
  def new
    @assist = Assist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @assist }
    end
  end

  # GET /assists/1/edit
  def edit
    @assist = Assist.find(params[:id])
  end

  # POST /assists
  # POST /assists.json
  def create
    @assist = Assist.new(params[:assist])

    respond_to do |format|
      if @assist.save
        format.html { redirect_to @assist, :notice => 'Assist was successfully created.' }
        format.json { render :json => @assist, :status => :created, :location => @assist }
      else
        format.html { render :action => "new" }
        format.json { render :json => @assist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assists/1
  # PUT /assists/1.json
  def update
    @assist = Assist.find(params[:id])

    respond_to do |format|
      if @assist.update_attributes(params[:assist])
        format.html { redirect_to @assist, :notice => 'Assist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @assist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assists/1
  # DELETE /assists/1.json
  def destroy
    @assist = Assist.find(params[:id])
    @assist.destroy

    respond_to do |format|
      format.html { redirect_to assists_url }
      format.json { head :no_content }
    end
  end
end
