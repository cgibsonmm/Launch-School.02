def multisum(num)
  sum = 0
  (1..num).each do |val|
    sum += val if (val % 3).zero? || (val % 5).zero?
  end
  sum
end

puts multisum(20) == 98
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
