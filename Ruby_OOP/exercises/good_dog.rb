
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    puts 'This object was initialized!'
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
  
  def speak
    "#{name} says Arf!"
  end
end
