class GameController < ApplicationController
  def index
    @mods = Mod.all
  end

end
