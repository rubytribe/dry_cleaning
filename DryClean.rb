load 'validation.rb'
#require 'validation.rb'

#--------------------------------------------
class Order
  def init(open,close,pickup)
    @open=open
    @close=close
    @pickup=pickup
  end

  def getTime
    time1=Time.new
    @currentHour=time1.hour
    @currentMinute=time1.min
    #@currentDay=time1.wday #current day 0-Sunday, 1-Monday...
    @isWeekend=time1.saturday? or time1.sunday?
    @currentHour
  end

  def toString
    print @open,' ',@close,' ',@pickup
  end

  def returnValues
    return @open,@close,@pickup
  end

  def calculate(day)
    if day
      @hour=(@currentHour*60+@pickup)/60
      @minutes=@currentMinute*(@currentHour*60+@pickup)%60
      if @minutes>=60
        @minutes-=60
        @hours+=1
      end
      return @hour,@minutes, "Today"
    else
      @minutes=(@currentMinute+(@open*60+(@pickup-(@close*60-@currentHour*60)))%60)
      @hours=(@open*60+(@pickup-(@close*60-@currentHour*60)))/60
      
      if @minutes>=60
        @minutes-=60
        @hours+=1
      end
      return @hours,@minutes,"Tomorrow"
    end
  end
end




