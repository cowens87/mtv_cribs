require "minitest/autorun"
require "minitest/pride"
require "./lib/building"
require "./lib/renter"
require "./lib/apartment"

class BuildingTest < Minitest::Test
  # Iteration 2
  def setup
    @building = Building.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Building, @building
  end
end
