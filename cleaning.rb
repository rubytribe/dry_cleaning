
class DryCleaning
   
def userInput
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
end

def transformCurrentTimeIntoSeconds
  hours = Time.new.hour
  minutes = Time.new.min
  seconds = Time.new.sec
  @curr_time_in_sec = hours * 60 * 60 + minutes * 60 + seconds
end

def differenceDay
  difference = 24 * 60 * 60 - @close_time + @open_time
end

def differenceWeekend
  difference = 24 * 3 * 60 * 60 - @close_time + @open_time
end

def checkWashingForToday
  if transformCurrentTimeIntoSeconds >= @open_time && transformCurrentTimeIntoSeconds <= @close_time - @wash_time
    finish_time = Time.now + @wash_time
    puts "You can pick up your clothes #{finish_time.ctime}"
  end
end

def checkWashingForNextDay
  if Time.new.wday >=1 && Time.new.wday <=4 && transformCurrentTimeIntoSeconds > @close_time - @wash_time && transformCurrentTimeIntoSeconds < @close_time
    finish_time = Time.now + @wash_time + differenceDay
    puts "You can pick up your clothes #{finish_time.ctime}"
  end
end

def checkWashingForNextWeek
  if Time.new.wday == 5 && transformCurrentTimeIntoSeconds > @close_time - @wash_time && transformCurrentTimeIntoSeconds < @close_time
    finish_time = Time.now + @wash_time + differenceWeekend
    puts "You can pick up your clothes #{finish_time.ctime}"
  end
end

def verifyIfOpen
  if Time.new.wday == 0 || Time.new.wday == 6
    puts "Sorry, we're Closed! It's weekend!"
  elsif transformCurrentTimeIntoSeconds > @close_time || transformCurrentTimeIntoSeconds < @open_time
    puts "Sorry, we're Closed!"
  else
    puts "Clothes were brought in #{Time.now.ctime}"
  end
end

def pickUpTime
  userInput
  verifyIfOpen
  checkWashingForToday
  checkWashingForNextDay
  checkWashingForNextWeek
end  
  
end

