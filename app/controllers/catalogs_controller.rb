#encoding:utf-8
class CatalogsController < ApplicationController
  before_filter :authorize
  
  # GET /catalogs
  # GET /catalogs.xml
  def index
    @catalogs = Catalog.paginate :page => params[:page]
    @title = "Каталог"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @catalogs }
    end
  end

  # GET /catalogs/1
  # GET /catalogs/1.xml
  def show
    @catalog = Catalog.find(params[:id])
    @title = @catalog.title
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @catalog }
    end
  end

  # GET /catalogs/new
  # GET /catalogs/new.xml
  def new
    @catalog = Catalog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @catalog }
    end
  end

  # GET /catalogs/1/edit
  def edit
    @catalog = Catalog.find(params[:id])
  end

  # POST /catalogs
  # POST /catalogs.xml
  def create
    @catalog = Catalog.new(params[:catalog])

    respond_to do |format|
      if @catalog.save
        archive = File.open("#{@catalog.archive.path}")
        new_name = rand(1000*1000).to_i.abs.to_s + ".zip"
        splits_file = File.split(archive)
        File.rename("#{splits_file[0]}/#{splits_file[1]}", "#{splits_file[0]}/#{new_name}")
        @catalog.update_attribute("archive_file_name", new_name)
        
        format.html { redirect_to(@catalog, :notice => 'Catalog was successfully created.') }
        format.xml  { render :xml => @catalog, :status => :created, :location => @catalog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /catalogs/1
  # PUT /catalogs/1.xml
  def update
    @catalog = Catalog.find(params[:id])

    respond_to do |format|
      if @catalog.update_attributes(params[:catalog])
        format.html { redirect_to(@catalog, :notice => 'Catalog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.xml
  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy

    respond_to do |format|
      format.html { redirect_to(catalogs_url) }
      format.xml  { head :ok }
    end
  end
end
