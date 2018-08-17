require "minitest/autorun"
require "minitest/pride"
require "../lib/event"

class EventTest < Minitest::Test
  def test_it_exists
    event = Event.new("Shotput", [29, 21, 34, 17, 19])
    assert_instance_of Event, event
  end

  def test_it_has_attributes
    event = Event.new("Shotput", [29, 21, 34, 17, 19])
    assert_equal "Shotput", event.name
  end

  def test_it_can_get_max_age
    event = Event.new("Shotput", [29, 21, 34, 17, 19])
    assert_equal 34, event.max_age
  end

  def test_it_can_get_min_age
    event = Event.new("Shotput", [29, 21, 34, 17, 19])
    assert_equal 17, event.min_age
  end

  def test_it_can_get_average_age
    event = Event.new("Shotput", [29, 21, 34, 17, 19])
    assert_equal 24, event.average_age
  end

  def test_it_can_get_standard_deviation
    event = Event.new("Shotput", [29, 21, 34, 17, 19])
    assert_equal 6.45, event.standard_deviation_age
  end
end
