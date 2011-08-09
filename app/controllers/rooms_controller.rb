class RoomsController < ApplicationController
  # respond_to :html, :xml
  # GET /rooms
  # GET /rooms.xml
  def index
    @mods = Mod.all
    @rooms = Room.all(:order => :mod_id)
    
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @rooms }
    # end
  end

  # GET /rooms/1
  # GET /rooms/1.xml
  def show

    @character = current_character
    if (params[:exit])
      @room = Room.find_by_id(params[:exit])
      @monster1 = @room.monsters[0]
    else
      @room = Room.find(params[:id])
      @monster1 = @room.monsters[0]     
    end

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @room }
    # end
  end

  # GET /rooms/new
  # GET /rooms/new.xml
  def new
    @room = Room.new
    @room.mod_id = Mod.find(params[:mod_id]).id
    
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.xml  { render :xml => @room }
    # end
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

    # respond_to do |format|
      if @room.save
        redirect_to(@room, :notice => 'Room was successfully created.')
        # format.html { redirect_to(@room, :notice => 'Room was successfully created.') }
        # format.xml  { render :xml => @room, :status => :created, :location => @room }
      else
        render :action => "new"
        # format.html { render :action => "new" }
        # format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    # end
  end

  # PUT /rooms/1
  # PUT /rooms/1.xml
  def update
    @room = Room.find(params[:id])
    @character = Character.first
    @monster = @room.monsters[0]
    
    # respond_to do |format|
      if params[:game_option] == "attack"
        @battle = @room.battles << Battle.create

        @character_to_hit_roll = @room.battles[0].dice_roll("character", 20)
        if @character_to_hit_roll >= @monster.defence
          @monster_damage = @room.battles[0].dice_roll("damage roll", @character.damage)
        else 
          @monster_damage = 0
        end
        @monster_to_hit_roll = @room.battles[0].dice_roll("monster", 20)
        if @monster_to_hit_roll >= @character.defense
          @character_damage = @room.battles[0].dice_roll("damage roll", @monster.damage)
        else
          @character_damage = 0
        end

        @room.battles[0].attack(@character, @monster, @character_damage, @monster_damage)

        #@response = @room.battles[0].check_monster_health(@monster, @monster_damage)
        if @monster.health - @monster_damage < 0.1
          @response = "You killed the #{@monster.name}"
        else
          @response = "character roll - #{@character_to_hit_roll} damage - #{@monster_damage}, monster roll - #{ @monster_to_hit_roll}, damage - #{@character_damage}" 
        end
        redirect_to(@room, :notice => @response )

        # format.html {redirect_to(@room, :notice => @response )}
        # format.xml {head :ok}
      else
        if @room.update_attributes(params[:room])
          redirect_to(@room, :notice => "You updated ok")
          # format.html { redirect_to(@room, :notice => "Hmm that was strange. Probably a bug") }
          # format.xml  { head :ok }
        else
          render :action => "edit"
          # format.html { render :action => "edit" }
          # format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
        end
      end
    # end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.xml
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to(rooms_url)

    # respond_to do |format|
    #   format.html { redirect_to(rooms_url) }
    #   format.xml  { head :ok }
    # end
  end

end
