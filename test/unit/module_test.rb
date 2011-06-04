require 'test_helper'

class ModuleTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Module.new.valid?
  end
end
