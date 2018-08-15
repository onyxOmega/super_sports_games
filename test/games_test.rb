require 'minitest/autorun'
require 'minitest/pride'
require '../lib/games'
require '../lib/event'

class GamesTest < Minitest::Test
  def test_it_exists
    games = Games.new(2017)
    assert_instance_of Games, games
  end

  def test_it_has_a_year
    games = Games.new(2017)
    assert_equal 2017, games.year
  end

  def test_events_starts_empty
    games = Games.new(2017)
    assert_equal [], games.events
  end

  def test_it_can_add_events
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    ring_toss = Event.new("Ring Toss", [23, 22, 29, 18, 30])
    games = Games.new(2017)
    games.add_event(curling)
    games.add_event(ring_toss)
    assert_equal [curling, ring_toss], games.events
  end

  def test_it_can_create_headers
    games = Games.new(2017)
    expected = "Event          Max Age             Min Age             Average Age         StdDev Age"
    assert_equal expected, games.headers
  end

  def test_it_can_create_a_single_event_summary
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    games = Games.new(2017)
    expected = "Curling        41                  18                  26.6                8.28"
    assert_equal expected, games.event_summary(curling)
  end

  def test_it_can_create_a_summary_for_all_events
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    ring_toss = Event.new("Ring Toss", [23, 22, 29, 18, 30])
    games = Games.new(2017)
    games.add_event(curling)
    games.add_event(ring_toss)
    expected = "Curling        41                  18                  26.6                8.28\n" +
               "Ring Toss      30                  18                  24.4                4.5"
    assert_equal expected, games.all_events_summary
  end

  def test_it_can_create_a_summary_for_the_games
    skip
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    ring_toss = Event.new("Ring Toss", [23, 22, 29, 18, 30])
    games = Games.new(2017)
    games.add_event(curling)
    games.add_event(ring_toss)

    expected = "Event          Max Age             Min Age             Average Age         StdDev Age\n"
               "Curling        41                  18                  26.6                8.28\n" +
               "Ring Toss      30                  18                  24.4                4.5"

    assert_equal expected, games.summary
  end
end
