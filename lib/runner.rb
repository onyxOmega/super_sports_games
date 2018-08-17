require "./event"
require "./event_planner"
require "pry"

def welcome
  puts "Please enter the year."
  print ">> "
  year = gets.chomp.to_i
  puts "Welcome to the #{year} Super Sports Games planning committee."
end

welcome
event_planner = EventPlanner.new
event_planner.run_loop
