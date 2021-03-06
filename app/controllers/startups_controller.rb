class StartupsController < ApplicationController

  before_filter :require_admin, :except => ['index', 'show']

  # GET /startups
  # GET /startups.xml
  def index
    #.order(sort_column + " " + sort_direction)
    @startups = Startup.search(params[:search]).order('created_at desc').paginate(:per_page => 12, :page => params[:page])
  end

  # GET /startups/1
  # GET /startups/1.xml
  def show
    if params[:startup_usersname]
     @startup = Startup.find_by_username(params[:startup_usersname])        
    else
      @startup = Startup.find(params[:id])
    end

    @amount_raised = transaction_amount('donation', @startup.id)
    @percent_raised = ((@amount_raised / @startup.donation_amount)*100)

    if @percent_raised.infinite? || @percent_raised > 100 || @percent_raised.nan? 
      @percent_raised = 100
    else
      @percent_raised = @percent_raised.to_i
    end

    @amount_to_go = @startup.donation_amount.to_f - @amount_raised.to_f

    if @amount_to_go < 0
      @amount_to_go = 0
    end



    @descriptions = @startup.descriptions.find(:all)
    @bpsections = @startup.bpsections.find(:all)

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

    description = @startup.descriptions.build
    bpsection = @startup.bpsections.build

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
    @users = User.find(:all, :conditions => ['user_type = "User"'])
    @startup = Startup.new(params[:startup])

    respond_to do |format|
      if @startup.save
        format.html { redirect_to(@startup, :notice => 'Startup was successfully created.') }
        format.xml  { render :xml => @startup, :status => :created, :location => @startup }
      else
        description = @startup.descriptions.build
        format.html { render :action => "new" }
        format.xml  { render :xml => @startup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /startups/1
  # PUT /startups/1.xml
  def update
    @users = User.find(:all, :conditions => ['user_type = "User"'])
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
