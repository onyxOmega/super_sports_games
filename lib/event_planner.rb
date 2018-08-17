class EventPlanner
  def initialize
    @event_list = []
    @year
  end

  def run_loop
    welcome
    while true
      input = get_selection
      if input.downcase == "quit" || input.downcase == "q"
        break
      elsif input == "1"
        @event_list << create_new_event
        binding.pry
      elsif input == "2"
        modify_existing_event
      elsif input == "3"
        display_event_summary
      else
        display_invalid
      end
    end
  end

  def welcome

  end

  def create_new_event
    if @event_list.length <= 10
      input = get_event_info
      name = input[0]
      ages = ages_to_int(input[1])
      new_event = Event.new(name, ages)
    else
      puts "There are too many events to add more!",
           "Maybe you should cancel one."
      puts @event_list.length
    end
  end

  def get_event_info
    input = []
    puts "Enter event name."
    print ">> "
    input << gets.chomp
    puts "Enter participant ages, separated by spaces."
    print ">> "
    input << gets.chomp
  end

  def ages_to_int(age_input)
    ages = age_input.split(" ")
    ages = ages.map do |age|
      age.to_i
    end
  end

  def modify_existing_event
    puts "chose 1"
  end

  def display_event_summary
    puts "chose 1"
  end
  def display_invalid
    print "Invalid selection"
    3.times do
      print "."
      sleep(0.7)
    end
    puts "\n\n"
  end

  def get_selection
    puts "Please choose from the following options.\n(enter 'q' or 'quit' to quit)"
    puts "1. Create a New Event"
    puts "2. Cancel an Event"
    puts "3. Display Event Summary"
    print ">> "
    gets.chomp
  end
end
