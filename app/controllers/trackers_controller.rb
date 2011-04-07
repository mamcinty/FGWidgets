class TrackersController < ApplicationController
  load_and_authorize_resource

  def index
    unless current_user.admin?
      @trackers = current_user.trackers.all
    else
      @trackers = Tracker.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trackers }
    end
  end

  # GET /trackers/1
  # GET /trackers/1.xml
  def show
    respond_to do |format|
      format.html { render :layout => 'tracker' } # show.html.erb
      format.xml  { render :xml => @tracker }
    end
  end

  def code
    respond_to do |format|
      format.js
    end
  end
  
  # GET /trackers/new
  # GET /trackers/new.xml
  def new
    3.times do
      @tracker.trackings.build
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tracker }
    end
  end

  # GET /trackers/1/edit
  def edit
  end

  # POST /trackers
  # POST /trackers.xml
  def create
    @tracker = current_user.trackers.new(params[:tracker])

    respond_to do |format|
      if @tracker.save
        format.html { redirect_to(trackers_url, :notice => 'Tracker was successfully created.') }
        format.xml  { render :xml => @tracker, :status => :created, :location => @tracker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tracker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trackers/1
  # PUT /trackers/1.xml
  def update
    respond_to do |format|
      if @tracker.update_attributes(params[:tracker])
        format.html { redirect_to(trackers_url, :notice => 'Tracker was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tracker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/1
  # DELETE /trackers/1.xml
  def destroy
    @tracker.destroy

    respond_to do |format|
      format.html { redirect_to(trackers_url) }
      format.xml  { head :ok }
    end
  end
end