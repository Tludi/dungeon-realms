class MonstertomesController < ApplicationController
  # GET /monstertomes
  # GET /monstertomes.xml
  def index
    @monstertomes = Monstertome.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @monstertomes }
    end
  end

  # GET /monstertomes/1
  # GET /monstertomes/1.xml
  def show
    @monstertome = Monstertome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @monstertome }
    end
  end

  # GET /monstertomes/new
  # GET /monstertomes/new.xml
  def new
    @monstertome = Monstertome.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @monstertome }
    end
  end

  # GET /monstertomes/1/edit
  def edit
    @monstertome = Monstertome.find(params[:id])
  end

  # POST /monstertomes
  # POST /monstertomes.xml
  def create
    @monstertome = Monstertome.new(params[:monstertome])

    respond_to do |format|
      if @monstertome.save
        format.html { redirect_to(@monstertome, :notice => 'Monstertome was successfully created.') }
        format.xml  { render :xml => @monstertome, :status => :created, :location => @monstertome }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @monstertome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /monstertomes/1
  # PUT /monstertomes/1.xml
  def update
    @monstertome = Monstertome.find(params[:id])

    respond_to do |format|
      if @monstertome.update_attributes(params[:monstertome])
        format.html { redirect_to(@monstertome, :notice => 'Monstertome was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @monstertome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /monstertomes/1
  # DELETE /monstertomes/1.xml
  def destroy
    @monstertome = Monstertome.find(params[:id])
    @monstertome.destroy

    respond_to do |format|
      format.html { redirect_to(monstertomes_url) }
      format.xml  { head :ok }
    end
  end
end
