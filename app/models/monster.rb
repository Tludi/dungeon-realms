class Monster < ActiveRecord::Base
  default_scope :order => :monster_number

  has_many :monstertomes
  has_many :rooms, :through => :monstertomes

    def self.get_monster_info(number, mon_attr)
      @monster = Monster.find_by_monster_number(number)
      if @monster
        @monster.send(mon_attr)
      end
    end

    def self.options(option, id)
    @option = option
    if @option == "attack"
      take_damage(id)
      @notice = @output
    else @option == "heal"
      heal(id)
      @notice = @output
    end
  end

  def self.take_damage(id)
      damage = dice_roll(6)
      monster = Monster.find_by_id(id)
      monster.health -= damage
      monster.save
      @output = "You were hit!"
  end

  def self.heal(id)
    healing = dice_roll(6)
    monster = Monster.find_by_id(id)
    monster.health += healing
    monster.save
    @output = "You were healed!"
  end

  def self.dice_roll(die)
    @die_roll = 1+rand(die)
  end

end
