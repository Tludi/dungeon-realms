require 'test_helper'

class ModTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Mod.new.valid?
  end
end
