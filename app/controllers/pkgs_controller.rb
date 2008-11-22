class PkgsController < ApplicationController
  # GET /pkgs
  # GET /pkgs.xml
  def index
    @pkgs = Pkg.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pkgs }
    end
  end

  # GET /pkgs/1
  # GET /pkgs/1.xml
  def show
    @pkg = Pkg.find_by_name(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pkg }
    end
  end

  # GET /pkgs/new
  # GET /pkgs/new.xml
  def new
    @pkg = Pkg.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pkg }
    end
  end

  # GET /pkgs/1/edit
  def edit
    @pkg = Pkg.find_by_name(params[:id])
  end

  # POST /pkgs
  # POST /pkgs.xml
  def create
    @pkg = Pkg.new(params[:pkg])
    @pkg.owner = current_user

    respond_to do |format|
      if @pkg.save
        flash[:notice] = 'Pkg was successfully created.'
        format.html { redirect_to(@pkg) }
        format.xml  { render :xml => @pkg, :status => :created, :location => @pkg }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pkg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pkgs/1
  # PUT /pkgs/1.xml
  def update
    @pkg = Pkg.find_by_name(params[:id])

    respond_to do |format|
      if @pkg.update_attributes(params[:pkg])
        flash[:notice] = 'Pkg was successfully updated.'
        format.html { redirect_to(@pkg) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pkg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pkgs/1
  # DELETE /pkgs/1.xml
  def destroy
    @pkg = Pkg.find_by_name(params[:id])
    @pkg.destroy

    respond_to do |format|
      format.html { redirect_to(pkgs_url) }
      format.xml  { head :ok }
    end
  end

  def fork
    @pkg = Pkg.find_by_name(params[:id])
    @clone = @pkg.repos.build(:user => current_user)


    if @clone.save

    respond_to do |format|
      format.html { redirect_to(@clone) }
      format.xml  { head :ok }
    end
    else
    end
  end
end
