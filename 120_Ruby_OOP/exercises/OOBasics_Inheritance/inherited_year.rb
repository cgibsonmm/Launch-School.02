class Vehical
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Car < Vehical
end

class Truck < Vehical
end


truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year
