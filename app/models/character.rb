class Character < ActiveRecord::Base
  attr_accessible :name, :char_class, :race, :level, :health, :energy, :experience, :damage, :defense, :gold, :platinum

  def self.options(option)
    @option = option
    if @option == "attack"
      take_damage
    else @option == "heal"
      heal
    end
  end

  def self.take_damage
      @damage = dice_roll(6)
      @character = Character.first
      @character.health -= @damage
      @character.save
      @notice = "You were hit!"
  end

  def self.heal
    @healing = dice_roll(6)
    @character = Character.first
    @character.health += @healing
    @character.save
    @notice = "You were healed!"
  end

  def self.dice_roll(die)
    @die_roll = 1+rand(die)
  end

end
