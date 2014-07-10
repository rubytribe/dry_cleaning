require_relative "cleaning.rb"

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

dry_cleaner = DryCleaning.new(@open_time, @close_time, @wash_time)
puts dry_cleaner.verify_if_open
puts dry_cleaner.check_washing_for_today
puts dry_cleaner.check_washing_for_next_day
puts dry_cleaner.check_washing_for_next_week
