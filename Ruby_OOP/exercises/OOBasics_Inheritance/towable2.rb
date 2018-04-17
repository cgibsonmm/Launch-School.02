module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehical
  attr_accessor :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehical
  include Towable
end

class Car < Vehical
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year
