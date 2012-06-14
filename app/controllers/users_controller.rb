class UsersController < ApplicationController
  
  before_filter :require_admin, :except => ['home', 'index', 'show']

  def home
    #@startups = Startup.find(:all, :conditions => ['active = ?', true], :limit => 20)
    @startups = Startup.find(:all, :limit => 20)
    find_section_page('how_it_works')
  end

  def index
    if(params[:user_type])
      @users = User.find(:all, :conditions => ["user_type = (?)", params[:user_type]])
    else
      @users = User.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        AmiMailer.new_signup_email(@user).deliver 
        # Uncomment these two lines when admins don't create users. These two lines set the user as logged in when they signup
        # cookies.permanent[:auth_token] = @user.auth_token
        # session[:user_id] = @user.id
        format.html { redirect_to(root_url, :notice => 'Signed Up!') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def admin
  end

end
