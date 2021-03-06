require "minitest/autorun"
require "minitest/pride"
require "./lib/renter"
require "./lib/apartment"

class ApartmentTest < Minitest::Test
  # Iteration 1
  def setup
    @unit1 = Apartment.new({
                            number: "A1",
                            monthly_rent: 1200,
                            bathrooms: 1,
                            bedrooms: 1
                            })
    @renter1 = Renter.new("Jessie")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Apartment, @unit1
    assert_equal 'A1', @unit1.number
    assert_equal 1200, @unit1.monthly_rent
    assert_equal 1, @unit1.bathrooms
    assert_equal 1, @unit1.bedrooms
  end

  def test_it_can_add_a_renter
    assert_nil @unit1.renter
    @unit1.add_renter(@renter1)
    assert_equal @renter1, @unit1.renter
  end
end
