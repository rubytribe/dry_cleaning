
class DryCleaning

attr_accessor :open_time, :close_time, :wash_time

def initialize(open,close,wash)
  @open_time = open
  @close_time = close
  @wash_time = wash
end
   
def transform_current_time_into_seconds
  hours = Time.new.hour
  minutes = Time.new.min
  seconds = Time.new.sec
  @curr_time_in_sec = hours * 60 * 60 + minutes * 60 + seconds
end

def difference_day
  difference = 24 * 60 * 60 - @close_time + @open_time
end

def difference_weekend
  difference = 24 * 3 * 60 * 60 - @close_time + @open_time
end

def check_washing_for_today
  if transform_current_time_into_seconds >= @open_time && transform_current_time_into_seconds <= @close_time - @wash_time
    finish_time = Time.now + @wash_time
    puts "You can pick up your clothes #{finish_time.ctime}"
  end
end

def check_washing_for_next_day
  if Time.new.wday >=1 && Time.new.wday <=4 && transform_current_time_into_seconds > @close_time - @wash_time && transform_current_time_into_seconds < @close_time
    finish_time = Time.now + @wash_time + difference_day
    puts "You can pick up your clothes #{finish_time.ctime}"
  end
end

def check_washing_for_next_week
  if Time.new.wday == 5 && transform_current_time_into_seconds > @close_time - @wash_time && transform_current_time_into_seconds < @close_time
    finish_time = Time.now + @wash_time + difference_weekend
    puts "You can pick up your clothes #{finish_time.ctime}"
  end
end

def verify_if_open
  if Time.new.wday == 0 || Time.new.wday == 6
    puts "Sorry, we're Closed! It's weekend!"
  elsif transform_current_time_into_seconds > @close_time || transform_current_time_into_seconds < @open_time
    puts "Sorry, we're Closed!"
  else
    puts "Clothes were brought in #{Time.now.ctime}"
  end
end

end

