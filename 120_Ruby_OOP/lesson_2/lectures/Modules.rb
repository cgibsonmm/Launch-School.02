module Swim
  def swim
    "swimming!"
  end
end

class Dog
  include Swim

  # Rest of class omitted!
end

class Fish
  include Swim

  # Rest of class omitted!
end


puts Fish.ancestors
