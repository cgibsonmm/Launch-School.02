def get_grade(*arg)
  avg = arg.reduce(:+) / arg.length
  case avg
  when 90..100 then  'A'
  when 80..90 then   'B'
  when 70..80 then   'C'
  when 60..70 then   'D'
  else               'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
