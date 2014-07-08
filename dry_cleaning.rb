class DryCleaning
  attr_accessor :opening_hour, :closing_hour
  
  def initialize(opening_hour = 8, closing_hour = 16)
    @opening_hour = opening_hour
    @closing_hour = closing_hour
  end
  
  
  # return the pick up date and time for a client
  # takes argument the duration of cleaning time in minutes
  def pickup_time(cleaning_time = 120)
    t = Time.now
    # get the cleaning time in seconds
    cleaning_time *= 60
    
    # check if the clothes were delivered outside of schedule
    outside_schedule = check_if_in_schedule(t, cleaning_time)
    return outside_schedule if outside_schedule 
    
    # check if the clothes are ready today
    finish_time = t + cleaning_time
    if finish_in_schedule?(finish_time)
      return finish_time
    else
      return next_day(t) + remaining(t, cleaning_time)
    end
  end
  
  # return the date and time for an order delivered outside of schedule
  # return nil if the order was placed during schedule
  def check_if_in_schedule(t, cleaning_time)
    if t.hour >= @closing_hour
      return next_day(t) + cleaning_time
    elsif t.hour < @opening_hour
      return Time.mktime(t.year,t.month,t.day,@opening_hour) + cleaning_time
    else
      nil
    end
  end
  
  def finish_in_schedule?(finish_time)
    if finish_time.hour >= @closing_hour
      false
    else
      true
    end
  end
  
  # return the date of the next day at the opening hour
  def next_day(t)
    # one day in seconds
    one_day = 24*60*60
    
    # set t to the opening hour
    t = Time.mktime(t.year,t.month,t.day,@opening_hour)
    
    # switch to next day
    if t.friday?
      return t += 3 * one_day
    else
      return t += one_day
    end
  end
  
  
  # return the remaining time for cleaning the next day
  def remaining(t, cleaning_time)
    # subtract from the total cleaning time the time already worked today (the difference
    # between the closing hour and the current time)
    cleaning_time - (@closing_hour*60*60 - seconds(t))
  end
   
  # get the time in seconds
  def seconds(t)
    result = 0
    result += t.hour * 60 * 60
    result += t.min * 60
    result += t.sec
  end
  
end

