class DryCleanning

  #getter method
  attr_accessor :start_day, :end_day
  
  #constructor method
  def initialize(start_day, end_day)
    @start_day = start_day
    @end_day = end_day
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
  def tomorrow(cl_time)
    day = 24*60*60
    
    pick = remaining_hours_tomorrow(cl_time)
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
  
  #compute the remaining time for cleanning clothes the next day
  def remaining_hours_tomorrow(cl_time)
    done_today = @end_day*60*60 - get_seconds(current_time)
    
    remain = cl_time - done_today
  end
  
  
  #check the schedule
  def check_cleanning_hours(curr_time, cl_time)
      
    if curr_time.hour < @start_day
      pickup_time = today(cl_time)

    elsif curr_time.hour + cl_time/60/60 > @end_day
      pickup_time = tomorrow(cl_time)

    else
      pickup_time = curr_time + cl_time

    end  
    
    return pickup_time
  end
  
  
  #time when to pick up clothes
  def get_ok_time(cl_time)
    curr_time = current_time
    check_cleanning_hours(curr_time, cl_time)
  end
  
end