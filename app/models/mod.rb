class Mod < ActiveRecord::Base
  default_scope :order => 'title'
  attr_accessible :title, :description
  has_many :rooms

  def self.get_monster_name(number)
    @monster = Monster.find_by_monster_number(number)
    if @monster
      @monster.name
    end
  end


end
