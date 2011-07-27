class Character < ActiveRecord::Base
  attr_accessible :name, :char_class, :race, :level, :health, :energy, :experience, :damage, :defense, :gold, :platinum

  def self.options(option)
    @option = option
    if @option == "attack"
      take_damage
      @notice = @output
    else @option == "heal"
      heal
      @notice = @output
    end
  end

  def self.take_damage
      damage = dice_roll(6)
      character = Character.first
      character.health -= damage
      character.save
      @output = "You were hit!"
  end

  def self.heal
    @healing = dice_roll(6)
    @character = Character.first
    @character.health += @healing
    @character.save
    @output = "You were healed!"
  end

  def self.dice_roll(die)
    @die_roll = 1+rand(die)
  end

private

  def self.reset_stats
    character = Character.first
    monster = Monster.find_by_name("Orc")
    character.health = 20
    monster.health = 10
    character.save
    monster.save
  end


end
