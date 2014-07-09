load "cleanning.rb"

dry_cleaner = DryCleanning.new
cleanning_interval = 2*60*60 #2hours
dry_cleaner.display_hours
puts "Come to pick up your clothes at: " + dry_cleaner.get_ok_time(cleanning_interval)