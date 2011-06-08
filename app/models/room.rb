class Room < ActiveRecord::Base
  belongs_to :mod
  
  validates_uniqueness_of :room_number, :on => :create, :message => " must be unique"
end
