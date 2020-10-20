require "minitest/autorun"
require "minitest/pride"
require "./lib/building"
require "./lib/renter"
require "./lib/apartment"

class BuildingTest < Minitest::Test
  # Iteration 2
  def setup
    @building = Building.new
    @unit1 = Apartment.new({
                            number: "A1",
                            monthly_rent: 1200,
                            bathrooms: 1,
                            bedrooms: 1
                            })
    @unit2 = Apartment.new({
                            number: "B2",
                            monthly_rent: 999,
                            bathrooms: 2,
                            bedrooms: 2
                            })
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Building, @building
  end

  def test_it_can_add_units
    assert_equal [], @building.units

    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    assert_equal [@unit1, @unit2], @building.units
  end
end
