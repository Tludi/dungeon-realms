class Room < ActiveRecord::Base
  belongs_to :mod
  has_many :monstertomes
  has_many :monsters, :through => :monstertomes 
  has_many :battles
  
  validates_uniqueness_of :room_number, :on => :create, :message => " must be unique"

end
