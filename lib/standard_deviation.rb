ages = [24, 30, 18, 20, 41]

def average(numbers)
  numbers.sum.to_f / numbers.length
end

def std_dev(numbers)
  average = average(numbers)
  Math.sqrt(numbers.map {|e| (e - average) ** 2 }.sum / numbers.length)
end

puts std_dev(ages)
