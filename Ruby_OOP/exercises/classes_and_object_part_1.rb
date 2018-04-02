class MyCar
  attr_accessor :color, :model, :speed, :ignition
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @ignigtion = false
  end

  def start_car
    self.ignition = ignition != true
  end

  def ignition_status
    @ignition ? 'Running' : 'Off'
  end

  def accel(ammount)
    self.speed += ammount
  end

  def brake(ammount)
    self.speed -= ammount
  end

  def display_speed
    "#{speed} mph"
  end

  def self.find_gas_mileage(gallons, miles)
    puts "#{miles/ gallons} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new color is #{color}"
  end

  def car_status
    "Your #{year} #{color} #{model}, is #{ignition_status} and moving #{display_speed}"
  end

  def to_s
    car_status
  end
end
