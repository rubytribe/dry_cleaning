
class DryClean
  attr_accessor :current_time, :delivery_time, :service_time, :opening_hour, :closing_hour

  def initialize(service_time, opening_hour, closing_hour)
    @current_time = Time.now
    @delivery_time = @current_time
    if service_time < 30 * 60  
      puts "Minimum service time is 30 minutes"
      @service_time = 30 * 60
    elsif service_time > 120 * 60
      puts "Maximum service time is 2 hours"
      @service_time = 120 * 60
    else
      @service_time = service_time
    end

    if (closing_hour > opening_hour) or (closing_hour < 24) or (opening_hour > 0)
      @closing_hour = closing_hour
      @opening_hour = opening_hour
    else
      puts "Closing hour must be higher than opening hour"
      return nil
    end
  end


  
  # schedule: mon - fri 10 - 18
  def get_order
    if is_open(@current_time)
      place_order
    else
      puts "closed"
      return nil
    end
    return @delivery_time
  end

  private
  
  def is_open(time)
   if time.sunday? or time.saturday?
      return false
    end


    if time.hour < @opening_hour or time.hour > @closing_hour
      return false
    end

    return true
  end


  
  def place_order
    eod = Time.mktime(@delivery_time.year, @delivery_time.month, @delivery_time.day, @closing_hour, 0, 0) #end of the currrent day
    order = @service_time

    #checks if the order can be performed in the current day
    if(@delivery_time + order > eod)
      order -= (eod - @delivery_time)
      next_day  
    end
    @delivery_time += order

  end

  #this method sets the delivery time to the next working day
  def next_day
    if @delivery_time.friday?
      @delivery_time += 3 * 24 * 3600
      @delivery_time = Time.mktime(@delivery_time.year, @delivery_time.month, @delivery_time.day, @opening_hour, 0, 0)
    else
      @delivery_time += 1 * 24 * 3600
      @delivery_time = Time.mktime(@delivery_time.year, @delivery_time.month, @delivery_time.day, @opening_hour, 0, 0)
    end
    
  end
end
