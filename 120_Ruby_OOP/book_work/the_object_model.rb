# You can create a new object in Ruby buy defining a
# new class and then instantiate the object

class MyClass
end

new_class = MyClass.new

# A module is a block of code that can be used to give
# functionality to a class that may be share over many
# classes, to use a module in a class you can call

module MyModule
  puts 'Hello from the module!'
end

class MySecondClass
  include MyModule
end

my_obj = MySecondClass.new
