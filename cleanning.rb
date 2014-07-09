class DryCleanning

  #getter method
  attr_reader :start_day, :end_day
  
  #constructor method
  def initialize
    @start_day = 8
    @end_day = 14
  end
  
  #dry cleaner's schedule
  def display_hours
    puts "The dry cleaner opens at: #@start_day"
    puts "The dry cleaner closes at: #@end_day"
  end
  
  #get the current time
  def current_time
    curr_time = Time.now
  end
  
  #get current day
  def today(cl_time)
    today = Time.mktime(current_time.year, current_time.month, current_time.day, @start_day) + cl_time
  end
  
  #get next day
  def tommorow(cl_time)
    day = 24*60*60
    
    pick = pickup_time_tomorrow(cl_time)
    tmr = Time.mktime(current_time.year, current_time.month, current_time.day, @start_day) + pick
    
    if tmr.friday?
      return tmr + 3*day
    else
      return tmr + day
    end
  end
  
  #get the time only in seconds
  def get_seconds(time)
    seconds = time.hour*60*60 + time.min*60 + time.sec
  end
  
  #compute the remaining time for cleanning clothes
  def pickup_time_tomorrow(cl_time)
    done_today = @end_day*60*60 - get_seconds(current_time)
    
    pickup = cl_time - done_today
    return pickup
  end
  
  
  #check the schedule
  def check_cleanning_hours(curr_time, cl_time)
      
    if curr_time.hour < @start_day
      pickup_time = today(cl_time)

    elsif curr_time.hour + cl_time/60/60 > @end_day
      pickup_time = tommorow(cl_time)

    else
      pickup_time = curr_time + cl_time

    end  
    
    return pickup_time.inspect
  end
  
  
  #time when to pick up clothes
  def get_ok_time(cl_time)
    display_hours
    
    curr_time = current_time
    check_cleanning_hours(curr_time, cl_time)
  end
  
end


dry_cleaner = DryCleanning.new
cleanning_interval = 2*60*60 #2hours
puts dry_cleaner.get_ok_time(cleanning_interval)

