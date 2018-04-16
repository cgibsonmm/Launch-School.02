class Cat
  attr_reader :name
  COLOR = 'purple'.freeze

  def initialize(name)
    @name = name
  end

  def greet
    "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
end


kitty = Cat.new('Sophie')
kitty.greet
