class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    names = []
    @units.each do |unit|
      if unit.renter.nil?
        names
      else
        names << unit.renter.name
      end
    end
    names
  end

  def average_rent
    total_units = @units.count
    sum = @units.sum do |unit|
      unit.monthly_rent
    end
    sum.to_f/total_units
  end

  def rented_units
    @units.select do |unit|
      unit.renter != nil
    end
  end
end
