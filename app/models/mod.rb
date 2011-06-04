class Mod < ActiveRecord::Base
  default_scope :order => 'title'
  attr_accessible :title, :description
  has_many :rooms


end
