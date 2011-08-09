class BattleController < ApplicationController
  def index
    @battle = Battle.all
  end

  def show
    @battle = Battle.find(params[:id])
  end

  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.new(params[:battle])

    respond_to do |format|
      if @battle.save
        format.html { redirect_to(@battle, :notice => 'Battle was successfully created.') }
        format.xml  { render :xml => @battle, :status => :created, :location => @battle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @battle.errors, :status => :unprocessable_entity }
      end
    end

end
