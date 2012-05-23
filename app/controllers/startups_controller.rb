class StartupsController < ApplicationController

  before_filter :require_admin, :except => ['index', 'show']

  # GET /startups
  # GET /startups.xml
  def index
    @startups = Startup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @startups }
    end
  end

  # GET /startups/1
  # GET /startups/1.xml
  def show
    if params[:startup_usersname]
     @startup = Startup.find_by_username(params[:startup_usersname])        
    else
      @startup = Startup.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @startup }
    end
  end

  # GET /startups/new
  # GET /startups/new.xml
  def new
    @startup = Startup.new
    @users = User.find(:all, :conditions => ['user_type = "User"'])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @startup }
    end
  end

  # GET /startups/1/edit
  def edit
    @startup = Startup.find(params[:id])
    @users = User.find(:all, :conditions => ['user_type = "User"'])
  end

  # POST /startups
  # POST /startups.xml
  def create
    @startup = Startup.new(params[:startup])

    respond_to do |format|
      if @startup.save
        format.html { redirect_to(@startup, :notice => 'Startup was successfully created.') }
        format.xml  { render :xml => @startup, :status => :created, :location => @startup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @startup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /startups/1
  # PUT /startups/1.xml
  def update
    @startup = Startup.find(params[:id])

    respond_to do |format|
      if @startup.update_attributes(params[:startup])
        format.html { redirect_to(@startup, :notice => 'Startup was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @startup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /startups/1
  # DELETE /startups/1.xml
  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy

    respond_to do |format|
      format.html { redirect_to(startups_url) }
      format.xml  { head :ok }
    end
  end
end
