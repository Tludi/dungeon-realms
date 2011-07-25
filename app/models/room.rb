class Room < ActiveRecord::Base
  belongs_to :mod
  has_many :monstertomes
  has_many :monsters, :through => :monstertomes 
  
  validates_uniqueness_of :room_number, :on => :create, :message => " must be unique"

  def self.get_monster(number)
    @monster = Monster.find_by_monster_number(number)
  end

  def self.attack_mode(character_id, monster_id)
    @character = Character.find_by_id(character_id)
    @monster = Monster.find_by_id(monster_id)
  

  end

end
