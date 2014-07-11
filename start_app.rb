load "dry_cleaner.rb"

class StartApp
  free_days = ["tuesday", "saturday", "sunday"]
  dry_cleaner = DryCleanning.new(free_days,8, 14)
  
  cleanning_interval = 2*60*60 #2hours

  dry_cleaner.display_hours

  puts "Come pick up your clothes at: "
  puts dry_cleaner.get_ok_time(cleanning_interval)
  
end