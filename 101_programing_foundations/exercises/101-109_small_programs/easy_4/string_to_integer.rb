DIGIT = { '1' => 1, '2' => 2, '3' => 3, '4' => 4,
          '5' => 5, '6' => 6, '7' => 7, '8' => 8,
          '9' => 9, '0' => 0 }.freeze

def string_to_integer(num)
  digits = num.chars.map { |val| DIGIT[val] }

  val = 0
  digits.each { |digit| val = 10 * val + digit }
  val
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
