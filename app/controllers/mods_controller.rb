class ModsController < ApplicationController
  def index
    @mods = Mod.all
  end

  def show
    @mod = Mod.find(params[:id])
    @rooms = @mod.rooms.all
  end

  def new
    @mod = Mod.new
  end

  def create
    @mod = Mod.new(params[:mod])
    if @mod.save
      redirect_to @mod, :notice => "Successfully created mod."
    else
      render :action => 'new'
    end
  end

  def edit
    @mod = Mod.find(params[:id])
  end

  def update
    @mod = Mod.find(params[:id])
    if @mod.update_attributes(params[:mod])
      redirect_to @mod, :notice  => "Successfully updated mod."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @mod = Mod.find(params[:id])
    @mod.destroy
    redirect_to mods_url, :notice => "Successfully destroyed mod."
  end
end
