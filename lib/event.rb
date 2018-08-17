class Event
  attr_reader :name, :ages, :average_age
  def initialize(name, ages)
    @name = name
    @ages = ages
  end

  def max_age
    @ages.max
  end

  def min_age
    @ages.min
  end

  def average_age
    (@ages.sum.to_f / @ages.length).round(2)
  end

  def standard_deviation_age
    avg = average_age
    diff_squared = ages.map do |age|
      (age - avg) ** 2
    end
    quotient = diff_squared.sum / ages.length
    Math.sqrt(quotient).round(2)
  end
end
