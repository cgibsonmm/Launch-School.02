require_relative 'inheritance.rb'

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
    @heros = %w[Superman Spiderman Batman]
    @cash = { ones: 12, fives: 2, tens: 0, twenties: 2, hundreds: 0 }
  end

  def cash_on_hand
    on_hand = 0
    @cash.each do |k, v|
      case k
      when :ones
        on_hand += v
      when :fives
        on_hand += 5 * v
      when :tens
        on_hand += 10 * v
      when :twenties
        on_hand += 20 * v
      when :hundreds
        on_hand += 100 * v
      end
    end
    format('$%.2f', on_hand)
  end

  def heros
    @heros.join(', ')
  end
end

joe = Person.new('joe')
bud = Bulldog.new
kitty = Cat.new

joe.pets << kitty
joe.pets << bud

puts joe.pets
p joe.cash_on_hand
p joe.heros
