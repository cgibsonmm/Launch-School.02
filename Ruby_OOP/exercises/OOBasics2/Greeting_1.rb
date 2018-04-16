class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat"
  end
end

Cat.generic_greeting

kitty = Cat.new
kitty.class.generic_greeting

# When we are calling kitty.class.generic_greeting you are not calling
# generic_greeting on the instance you are first calling the Cat class
# so really you are just calling Cat.generic_greeting
