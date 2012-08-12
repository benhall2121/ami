class BpsubsectionsController < ApplicationController
  # GET /bpsubsections
  # GET /bpsubsections.xml
  def index
    @bpsubsections = Bpsubsection.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bpsubsections }
    end
  end

  # GET /bpsubsections/1
  # GET /bpsubsections/1.xml
  def show
    @bpsubsection = Bpsubsection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bpsubsection }
    end
  end

  # GET /bpsubsections/new
  # GET /bpsubsections/new.xml
  def new
    @bpsubsection = Bpsubsection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bpsubsection }
    end
  end

  # GET /bpsubsections/1/edit
  def edit
    @bpsubsection = Bpsubsection.find(params[:id])
  end

  # POST /bpsubsections
  # POST /bpsubsections.xml
  def create
    @bpsubsection = Bpsubsection.new(params[:bpsubsection])

    respond_to do |format|
      if @bpsubsection.save
        format.html { redirect_to(@bpsubsection, :notice => 'Bpsubsection was successfully created.') }
        format.xml  { render :xml => @bpsubsection, :status => :created, :location => @bpsubsection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bpsubsection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bpsubsections/1
  # PUT /bpsubsections/1.xml
  def update
    @bpsubsection = Bpsubsection.find(params[:id])

    respond_to do |format|
      if @bpsubsection.update_attributes(params[:bpsubsection])
        format.html { redirect_to(@bpsubsection, :notice => 'Bpsubsection was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bpsubsection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bpsubsections/1
  # DELETE /bpsubsections/1.xml
  def destroy
    @bpsubsection = Bpsubsection.find(params[:id])
    @bpsubsection.destroy

    respond_to do |format|
      format.html { redirect_to(bpsubsections_url) }
      format.xml  { head :ok }
    end
  end
end
