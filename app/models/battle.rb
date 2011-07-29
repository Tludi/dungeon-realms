class Battle < ActiveRecord::Base

  def self.options(option, id)
    @option = option
    if @option == "attack"
      attack_chance
      if @die_roll >= 10
        take_damage(id)
        @hit = "yes"
      end
    else @option == "heal"
      heal(id)
    end
  end

  def self.take_damage(id)
      damage = dice_roll(6)
      monster = Monster.find_by_id(id)
      monster.health -= damage
      monster.save
  end

  def self.heal(id)
    healing = dice_roll(6)
    monster = Monster.find_by_id(id)
    monster.health += healing
    monster.save
  end

  def self.dice_roll(die=20)
    @die_roll = 1+rand(die)
  end

    def self.attack_chance
    @die_roll = dice_roll
  end

  
end
