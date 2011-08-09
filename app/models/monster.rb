class Monster < ActiveRecord::Base
  attr_accessible :name, :hit
  default_scope :order => :monster_number

  has_many :monstertomes
  has_many :rooms, :through => :monstertomes

    def test_method
      @text = "This is from the test method"
    end

end
