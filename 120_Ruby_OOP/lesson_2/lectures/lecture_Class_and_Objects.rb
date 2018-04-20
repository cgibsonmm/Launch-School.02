# 1. Given the below usage of the Person class, code the class definition.

# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name

# 1. Answer
# class Person
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
# end
#
# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name

# 2. Modify the class definition from above to facilitate the following methods.
# Note that there is no name= setter method now.

# 2. Answer
# class Person
#   attr_accessor :first_name, :last_name
#
#   def initialize(full_name)
#     parts = full_name.split('')
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end
#
#   def name
#     puts @first_name + ' ' + @last_name
#   end
# end
#
# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# 3. Now create a smart name= method that can take just a first name or a
# full name, and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  protected

  def compare_names(other_person)
    name == other_person.name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'

rob = Person.new('Robert Smith')
