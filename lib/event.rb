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
    @ages.sum.to_f / @ages.length
  end

  def standard_deviation_age
    avg = average_age
    Math.sqrt(ages.map {|e| (e - avg) ** 2 }.sum / ages.length)
  end
end
