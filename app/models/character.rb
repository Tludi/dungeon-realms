class Character < ActiveRecord::Base
  attr_accessible :name, :char_class, :race, :level, :health, :energy, :experience, :damage, :defense, :gold, :platinum
end
