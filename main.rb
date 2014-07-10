require_relative "cleaning.rb"

def menu
  puts"Hello! Welcome to Ruby Tribe DryCleaning"
  puts"       What would you like to do?"
  puts"   1. Bring the clothes in for cleaning"
  puts"   2. Select a free day"
  option = gets.chomp.to_i
  @free = false
  
  if option == 1
    puts "Opening Time:" 
    @open_time = gets.chomp.to_i * 60 * 60
    puts "Closing Time:" 
    @close_time = gets.chomp.to_i * 60 * 60
    puts "Give wash time in minutes:"
    @wash_time = gets.chomp.to_i * 60
    while @wash_time > 120 * 60
      puts "A washing cycle can't be longer than 2 hours! Please enter the correct time!!" 
      @wash_time = gets.chomp.to_i * 60
    end
    
    dry_cleaner = DryCleaning.new(@open_time, @close_time, @wash_time, @free_day)
    puts dry_cleaner.verify_if_open
    puts dry_cleaner.check_washing_for_today
    puts dry_cleaner.check_washing_for_next_day
    puts dry_cleaner.check_washing_for_next_week    
    
  elsif option == 2
    @free = true
    puts "Which day do you want it to be free?"
    puts "1 -- Monday   ;   2 -- Tuesday    ;   3 -- Wednesday    ;   4 -- Thursday   ;   5 -- Friday"
    @free_day = gets.chomp.to_i
    menu
  end
end

menu


