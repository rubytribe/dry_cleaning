class DryCleaning
  attr_reader :opening_hour, :closing_hour
  
  def initialize
    @opening_hour = 8
    @closing_hour = 16
  end
  
  # returns the date and time when the client should return to pick up the clothes
  def pickup_time
    _pickup_time Time.now
  end
  
  def _pickup_time t
    # cleaning time (2 hours) in seconds
    cleaning_time = 2*60*60
    finish_time = t + cleaning_time
    
    # if the clothes are ready today
    if finish_time.hour < @closing_hour
      return finish_time
    # if the clothes are ready tommorow
    else
    # the remaining time past the end of the program
    dif = finish_time - (@closing_hour*60*60) 
    # add dif to the opening hour
    dif += 8*60*60
    # add a day to dif
    dif += 24*60*60
    end
  end

end
