
class DryClean
  private
  attr_accessor :current_time, :delivery_time, :service_time
  
  public
  def initialize(current_time, service_time)
    @current_time = current_time
    @delivery_time = current_time
    if service_time < 30 * 60  
      puts "Minimum service time is 30 minutes"
      @service_time = 30 * 60
    elsif service_time > 120 * 60
      puts "Maximum service time is 2 hours"
      @service_time = 120 * 60
    else
      @service_time = service_time
    end
  end


  
  # schedule: mon - fri 10 - 18
  def get_order
    if is_open(@current_time)
      place_order
    else
      puts "closed"
      exit
    end
    return @delivery_time
  end


  def get_delivery_time
    return @delivery_time
  end

  def get_current_time
    return @current_time
  end

  def get_service_time
    return @service_time
  end

  private
  def is_open(time)
    if time.sunday? or time.saturday?
      return false
    end

    if time.hour < 10 or time.hour > 18
      return false
     end

    return true
  end


  
  def place_order
    eod = Time.mktime(@delivery_time.year, @delivery_time.month, @delivery_time.day, 18, 0, 0) #end of the currrent day
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
      @delivery_time = Time.mktime(@delivery_time.year, @delivery_time.month, @delivery_time.day, 10, 0, 0)
    else
      @delivery_time += 1 * 24 * 3600
      @delivery_time = Time.mktime(@delivery_time.year, @delivery_time.month, @delivery_time.day, 10, 0, 0)
    end
    
  end
end
