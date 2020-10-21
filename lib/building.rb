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

  def renter_with_highest_rent
    highest = @units.max_by do |unit|
      unit.monthly_rent
    end
    highest.renter
  end

  def units_by_number_of_bedrooms
    units_by_num = Hash.new {|hash_obj, key| hash_obj[key] = []}
    @units.each do |unit|
      units_by_num[unit.bedrooms] << unit.number
    end
    units_by_num
  end

  def annual_breakdown
    breakdown = Hash.new {|hash_obj, key| hash_obj[key] = 0}
    list = @units.select do |unit|
        unit.renter != nil
      end
    list.each do |item|
      breakdown[item.renter.name] += (item.monthly_rent * 12)
    end
    breakdown
  end

  def rooms_by_renter
    rooms = {}
    @units.each do |unit|
      if unit.renter != nil
      rooms[unit.renter] = {:bathrooms => unit.bathrooms, :bedrooms => unit.bedrooms}
      end
    end
    rooms
  end
end
