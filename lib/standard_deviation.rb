ages = [24, 30, 18, 20, 41]

def std_dev(numbers)
  numbers[0] = numbers[0].to_f # Make sure there's a float in there
  average = numbers.inject(:+) / numbers.length # Get the sum
  # do the rest of the math
  Math.sqrt(numbers.map {|e| (e - average) ** 2 }.inject(:+) / numbers.length)
end

puts std_dev(ages)
