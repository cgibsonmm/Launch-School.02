class Animal
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def speak
    'Hello!'
  end
end

class GoodDog < Animal
  attr_reader :color

  def initialize(name, color)
    super(name)
    @color = color
  end

  def speak
    "I #{name} say arf, and I am #{color}"
  end
end

class Cat < Animal
end

sparky = GoodDog.new('Rover', 'Gray')
paws = Cat.new('Black')
puts sparky.speak
puts paws.speak
