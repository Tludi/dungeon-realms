class Monster < ActiveRecord::Base
  has_many :monstertomes
  has_many :rooms, :through => :monstertomes
end
