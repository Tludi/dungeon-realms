class Monster < ActiveRecord::Base
  has_many :monstertomes
  has_many :rooms, :through => :monstertomes

    def self.get_monster_info(number, mon_attr)
      @monster = Monster.find_by_monster_number(number)
      if @monster
        @monster.send(mon_attr)
      end
    end

end
