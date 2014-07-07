class DryCleaning
  attr_accessor :opening_hour, :closing_hour
  
  def initialize opening_hour=8, closing_hour=16
    @opening_hour = opening_hour
    @closing_hour = closing_hour
  end
  
  
  # return the pick up date and time for a client
  # takes as an argument the cleaning interval in minutes
  # default 2 hours
  def pickup_time cleaning_time=120
    t = Time.now
    
    # cleaning time in seconds
    cleaning_time *= 60
    
    # one day in seconds
    one_day = 24*60*60
    
    opening_time = Time.mktime(t.year,t.month,t.day,@opening_hour)
    
    # if t is after the program we add the cleaning time to the opening hour tomorrow
    if t.hour > @closing_hour
      return opening_time + cleaning_time + one_day 
    end
    
    
    # if t is before the program starts we add the cleaning time to the opening hour today
    if t.hour < @opening_hour
      return opening_time + cleaning_time
    end
    
    
    finish_time = t + cleaning_time
    
    # if the clothes are ready today
    if finish_time.hour < @closing_hour
      return finish_time
    # if the clothes are ready tomorrow
    else
      dif = finish_time - (@closing_hour*60*60)
    # add dif to the opening hour
    dif += @opening_hour*60*60
    # add a day to dif
    dif += one_day
    end
  end

end


cleaner = DryCleaning.new 12, 18
print cleaner.pickup_time 120

