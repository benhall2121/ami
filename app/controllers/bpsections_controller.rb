class BpsectionsController < ApplicationController
  # GET /bpsections
  # GET /bpsections.xml
  def index
    @bpsections = Bpsection.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bpsections }
    end
  end

  # GET /bpsections/1
  # GET /bpsections/1.xml
  def show
    @bpsection = Bpsection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bpsection }
    end
  end

  # GET /bpsections/new
  # GET /bpsections/new.xml
  def new
    @bpsection = Bpsection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bpsection }
    end
  end

  # GET /bpsections/1/edit
  def edit
    @bpsection = Bpsection.find(params[:id])
  end

  # POST /bpsections
  # POST /bpsections.xml
  def create
    @bpsection = Bpsection.new(params[:bpsection])

    respond_to do |format|
      if @bpsection.save
        format.html { redirect_to(@bpsection, :notice => 'Bpsection was successfully created.') }
        format.xml  { render :xml => @bpsection, :status => :created, :location => @bpsection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bpsection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bpsections/1
  # PUT /bpsections/1.xml
  def update
    @bpsection = Bpsection.find(params[:id])

    respond_to do |format|
      if @bpsection.update_attributes(params[:bpsection])
        format.html { redirect_to(@bpsection, :notice => 'Bpsection was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bpsection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bpsections/1
  # DELETE /bpsections/1.xml
  def destroy
    @bpsection = Bpsection.find(params[:id])
    @bpsection.destroy

    respond_to do |format|
      format.html { redirect_to(bpsections_url) }
      format.xml  { head :ok }
    end
  end
end
