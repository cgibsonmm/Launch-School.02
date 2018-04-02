require 'minitest/autorun'

# Car
class Car
  attr_reader :wheels

  def initialize
    @wheels = 4
  end
end

# Car test
class TestCar < Minitest::Test
  def setup
    @my_car = Car.new
  end

  def test_car_wheels
    assert_equal 4, @my_car.wheels
  end
end
