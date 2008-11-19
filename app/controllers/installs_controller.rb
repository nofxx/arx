class InstallsController < ApplicationController
  # GET /installs
  # GET /installs.xml
  def index
    @installs = Install.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @installs }
    end
  end

  # GET /installs/1
  # GET /installs/1.xml
  def show
    @install = Install.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @install }
    end
  end

  # GET /installs/new
  # GET /installs/new.xml
  def new
    @install = Install.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @install }
    end
  end

  # GET /installs/1/edit
  def edit
    @install = Install.find(params[:id])
  end

  # POST /installs
  # POST /installs.xml
  def create
    @install = Install.new(params[:install])

    respond_to do |format|
      if @install.save
        flash[:notice] = 'Install was successfully created.'
        format.html { redirect_to(@install) }
        format.xml  { render :xml => @install, :status => :created, :location => @install }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @install.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /installs/1
  # PUT /installs/1.xml
  def update
    @install = Install.find(params[:id])

    respond_to do |format|
      if @install.update_attributes(params[:install])
        flash[:notice] = 'Install was successfully updated.'
        format.html { redirect_to(@install) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @install.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /installs/1
  # DELETE /installs/1.xml
  def destroy
    @install = Install.find(params[:id])
    @install.destroy

    respond_to do |format|
      format.html { redirect_to(installs_url) }
      format.xml  { head :ok }
    end
  end
end
