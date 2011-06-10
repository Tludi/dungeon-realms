class Monstertome < ActiveRecord::Base
  belongs_to :room
  belongs_to :monster
end
