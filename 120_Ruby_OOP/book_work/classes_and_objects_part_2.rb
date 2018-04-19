# GoodDog class
class GoodDog
  attr_accessor :name, :height, :weight, :age
  DOG_YEARS = 7
  @@number_of_dogs = 0

  # call .new to set name, height, width
  def initialize(name, height, width, age)
    puts 'This object was initialized!'
    @name = name
    @height = height
    @weight = width
    @age = age * DOG_YEARS
    @@number_of_dogs += 1
  end

  # Can call to change the info
  def change_info(name, height, width)
    self.name = name
    self.height = height
    self.weight = width
  end

  # puts info to comand line
  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end

  # Dog .speak speack
  def speak
    "#{name} says Arf!"
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years!"
  end

  # Class method can call .what_am_i on GoodDog
  def self.what_am_i
    "I'm a GoodDog class"
  end

  def what_is_self
    self
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

  puts self
end
