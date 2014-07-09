require_relative 'day'

class DryCleaning
  
  def initialize(open = 8, close = 16)
    # each day of the week is represented from 0 to 6 starting with Sunday
    @working_hours = []
    # Saturday and Sunday is closed 
    @working_hours[0] = Day.new(false)
    @working_hours[6] = Day.new(false)
    
    for n in (1..5)
      @working_hours[n] = Day.new(true, open, close)
    end
  end
  
  
  # return the pick up date and time for a client
  # takes argument the duration of cleaning time in minutes
  def pickup_time(cleaning_time = 120)
    t = Time.now
    # get the cleaning time in seconds
    cleaning_time *= 60
    
    # check if the clothes were delivered outside of schedule
    outside_schedule = check_if_outside_schedule(t, cleaning_time)
    return outside_schedule if outside_schedule
    
    # check if the clothes are ready today
    if finish_in_schedule?(t, cleaning_time)
      t + cleaning_time
    else
      next_day(t) + remaining(t, cleaning_time)
    end
  end
  
  
  def remove_working_day(n)
    @working_hours[n] = Day.new(false)
  end
  
  # takes argument the number of the day, open and close time
  def set_schedule(n, open, close)
    day = @working_hours[n]
    day.open = open
    day.close = close
  end
  
  # set the schedule for entire week
  def set_week_schedule(open, close)
    initialize(open, close)
  end
  
  def print_schedule
    days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    @working_hours.each_with_index do |day, i|
      puts(days_of_week[i] + ': ' + day.open.to_s + ' - ' + day.close.to_s) if day.working
    end
  end
  
  
  
  private
  
    def opening_hour(t)
    @working_hours[t.wday].open
  end
  
  def closing_hour(t)
    @working_hours[t.wday].close
  end
  
  
  # return the date and time for an order delivered outside of schedule
  # return nil if the order was placed during schedule
  def check_if_outside_schedule(t, cleaning_time)
    if t.hour >= closing_hour(t)
      next_day(t) + cleaning_time
    elsif t.hour < opening_hour(t)
      Time.mktime(t.year,t.month,t.day,opening_hour(t)) + cleaning_time
    else
      nil
    end
  end
  
  def finish_in_schedule?(t, cleaning_time)
    finish_time = t + cleaning_time
    # switching to next day won't cause returning true
    if finish_time.day != t.day
      false
    elsif finish_time.hour >= closing_hour(t)
      false
    else
      true
    end
  end
  
  # return the date of the next day at the opening hour
  def next_day(t)
    # one day in seconds
    one_day = 24*60*60
    
    t += one_day
    while(not @working_hours[t.wday].working)
      t += one_day
    end
    # set t to the opening hour
    Time.mktime(t.year,t.month,t.day,opening_hour(t))
  end
  
  
  # return the remaining time for cleaning the next day
  def remaining(t, cleaning_time)
    # subtract from the total cleaning time the time already worked today (the difference
    # between the closing hour and the current time)
    cleaning_time - (closing_hour(t)*60*60 - seconds(t))
  end
   
  # get the time in seconds
  def seconds(t)
    result = t.hour * 60 * 60
    result += t.min * 60
    result += t.sec
  end
  
end

cleaning = DryCleaning.new
cleaning.remove_working_day(4)
cleaning.set_schedule(3,8,14)
cleaning.set_schedule(5,12,18)
cleaning.print_schedule
