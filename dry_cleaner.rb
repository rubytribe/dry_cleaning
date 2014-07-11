class DryCleanning
  
  attr_accessor :start_day, :end_day, :free_days
  
  #constructor
  def initialize(free_d, s, e)
    @start_day = s
    @end_day = e
    @free_days = free_d
  end
  
  #get the current time
  def current_time
    curr_time = Time.now
  end

  #dry cleaner's schedule
  def display_hours
    starting_hour = Time.mktime(current_time.year, current_time.month, current_time.day, @start_day)
    ending_hour = Time.mktime(current_time.year, current_time.month, current_time.day, @end_day)
    puts "The dry cleaner opens at: #{starting_hour}"
    puts "The dry cleaner closes at: #{ending_hour}"
  end
  
  #get current day
  def today(cl_time)
    today = Time.mktime(current_time.year, current_time.month, current_time.day, @start_day) + cl_time
  end
  
  #get next day
  def tomorrow(cl_time)
    day = 24*60*60
    
    free_days = nr_next_free_days(current_time) + day
    pick = remaining_hours_tomorrow(cl_time)
    
    tmr = Time.mktime(current_time.year, current_time.month, current_time.day, @start_day) + pick + free_days
    
  end
  
  #get the time only in seconds
  def get_seconds(time)
    seconds = time.hour*60*60 + time.min*60 + time.sec
  end
  
  #compute the remaining time for cleanning clothes the next day
  def remaining_hours_tomorrow(cl_time)
    done_today = @end_day*60*60 - get_seconds(current_time)
    
    remain = cl_time - done_today

    return remain
  end
  
  #get the current day
  def current_day(day)
    case day
    when 0
      return "sunday"
    when 1
      return "monday"
    when 2
      return "tuesday"
    when 3
      return "wednesday"
    when 4
      return "thursday"
    when 5
      return "friday"
    when 6
      return "saturday"
    else
      return "error"
    end
  end
 
  #check if today is one of the free days
  def check_free_day(curr_time)
    for day in @free_days
      if day == current_day(curr_time.wday)
        return true
      end
    end
    return false
  end
  
  
  def nr_next_free_days(curr_time)
    day = 24*60*60
    nr = 0
    while check_free_day(curr_time + day)
       nr += 1
       day += 24*60*60
    end
    
    return nr
  end
  
  
  #check the schedule
  def check_cleanning_hours(curr_time, cl_time)
    
    day = 24*60*60
      
    if ( (curr_time.hour < @start_day) && !(check_free_day(curr_time)) )
      pickup_time = today(cl_time)

    elsif ( (curr_time.hour + cl_time/60/60 > @end_day) && (check_free_day(curr_time)==true))
      pickup_time = today(cl_time) + day + nr_next_free_days(curr_time)*day
      
    elsif ( (curr_time.hour + cl_time/60/60 > @end_day) && (check_free_day(curr_time) == false) )
      pickup_time = tomorrow(cl_time) + nr_next_free_days(curr_time)*day      
      
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