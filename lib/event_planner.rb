require "./games"

class EventPlanner
  def initialize
    puts "Please enter the year."
    print ">> "
    year = gets.chomp.to_i
    @games = Games.new(year)
    puts "Welcome to the #{year} Super Sports Games planning committee."
    self.run_loop
  end

  def run_loop
    while true
      input = get_main_selection
      if input.downcase == "quit" || input.downcase == "q"
        return
      elsif input == "1"
        @games.events << create_new_event
      elsif input == "2"
        cancel_existing_event
      elsif input == "3"
        display_event_summary
      else
        display_invalid
      end
    end
  end


  def get_main_selection
    puts "Please choose from the following options.\n(enter 'q' or 'quit' to quit)"
    puts "1. Create a New Event"
    puts "2. Cancel an Event"
    puts "3. Display Event Summary"
    print ">> "
    gets.chomp
  end


  def create_new_event
    if @games.events.length <= 10
      input = get_event_info
      name = input[0]
      ages = ages_to_int(input[1])
      new_event = Event.new(name, ages)
    else
      puts "There are too many games.events to add more!",
           "Maybe you should cancel one."
      puts @games.events.length
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


  def cancel_existing_event
    canceled = nil
    if @games.events.length > 0
      selection = get_cancel_selection.to_i
      if verify_cancel(selection)
        canceled = cancel_event(selection)
        print "The #{canceled.name} event has been canceled.\n",
             "Those guys will be disappointed"
        elipse
      end
    else
      print "No events are scheduled."
      elipse
    end
    canceled
  end


  def get_cancel_selection
    while true
      puts "Select an event to cancel. "
      @games.events.each_with_index do |event, index|
        puts "#{index + 1}: #{event.name}"
      end
      print ">> "
      selection = gets.chomp.to_i - 1
      if 0 <= selection && selection < @games.events.length
        return selection
      else
        display_invalid
      end
    end
  end


  def verify_cancel(selection)
    while true
      puts "Are you sure you want to cancel #{@games.events[selection].name}?(y/n)"
      print ">> "
      verify = gets.chomp
      if verify.downcase == "y"
        return true
      elsif verify.downcase == "n"
        return false
      else
        display_invalid
      end
    end
  end


  def cancel_event(selection)
    canceled = @games.events[selection]
    @games.remove_event(selection)
    canceled # return the cancelled event
  end


  def display_event_summary
    if @games.events.length > 0
      puts "\n"
      print @games.summary
      puts "\n"
      elipse
      puts "\n"
    else
      print "No events are scheduled."
      elipse
    end
  end


  def display_invalid
    print "Invalid selection"
    elipse
  end


  def elipse
    sleep 0.4
    3.times do
      print "."
      sleep 0.4
    end
    puts "\n\n"
  end

end
