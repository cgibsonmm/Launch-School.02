class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def personal_greeting
    "Hello! my name is #{name}!"
  end

  def self.generic_greeting
    "Hello! I'm a cat!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
