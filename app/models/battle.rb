class Battle < ActiveRecord::Base
  belongs_to :room


  def attack(character, monster, character_damage, monster_damage)
    @character = Character.find(character)
    @monster = Monster.find(monster)
    if character_damage > 0
      take_damage("character", @character, character_damage)
    end
    if monster_damage > 0
      take_damage("monster", @monster, monster_damage)
    end
  end


  def take_damage(type, character, damage )
    if type == "character"
      @character = character
      @character.health -= damage
      @character.save
    else type == "monster"
      @monster = character
      @monster.health -= damage
      @monster.save
    end
  end


  def dice_roll(roll_type, die)
    if roll_type == "character"
      @die_roll = 1+rand(die).to_i
    elsif roll_type == "monster"
      @die_roll = 1+rand(die).to_i
    elsif roll_type == "damage_roll"
      @damage_roll = 1+rand(die).to_i
    else
      @monster_damage_roll = 1+rand(die).to_i
    end
  end


end
