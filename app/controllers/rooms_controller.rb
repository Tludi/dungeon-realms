class RoomsController < ApplicationController
  # GET /rooms
  # GET /rooms.xml
  def index
    @mods = Mod.all
    @rooms = Room.all(:order => :mod_id)
    @monsters = Monster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.xml
  def show

    @character = Character.first

    if (params[:exit])
      @room = Room.find_by_id(params[:exit])
      @monster1 = @room.monster1
    else
      @room = Room.find(params[:id])     
    end
    
    if (params[:attack])
      Room.attack_mode(@room.id, @monster1.id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.xml
  def new
    @room = Room.new
    @room.mod_id = Mod.find(params[:mod_id]).id
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.xml
  def create
    #@mod = current_mod
    #@room = @mod.rooms.build(:mod_id => (params[:mod_id]))
    
    @room = Room.new(params[:room])
    #@cart = current_cart
    #product = Product.find(params[:product_id])
    #@line_item = @cart.line_items.build(:product => product)

    respond_to do |format|
      if @room.save
        format.html { redirect_to(@room, :notice => 'Room was successfully created.') }
        format.xml  { render :xml => @room, :status => :created, :location => @room }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.xml
  def update
    @room = Room.find(params[:id])
    @monsters = Monster.all
    
    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to(@room, :notice => 'Room was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.xml
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to(rooms_url) }
      format.xml  { head :ok }
    end
  end
  
  def show_exit_room
    @room = Room.find(params[:id])
    @exit_room = Room.find_by_room_number(@room.room_number) 
    render @room  
  end

  def attack
    @room = Room.find(params[:id])
    @monster1 = Monster.find_by_id(params[:mon_id])
    @character = Character.first
    @character.health +=3
    @character.save
    #character_id = Character.find_by_id(params[:char_id])
    #monster_id = Monster.find_by_id(params[:mon_id])
    #Room.attack_mode(character_id, monster_id)
    redirect_to @room
  end
    
end
