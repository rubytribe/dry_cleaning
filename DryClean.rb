load 'validation.rb'
#require 'ui'

#--------------------------------------------
class Order
  $freeDays={"Sunday" => true,"Monday"=>false,"Tuesday"=>false,"Wednesday"=>false,"Thursday"=>false,"Friday"=>false,"Saturday"=>true}
  
  def currentDay(day)
    if day==0
      "Sunday"
    elsif day==1
      "Monday"
    elsif day==2
      "Tuesday"
    elsif day==3
      "Wednesday"
    elsif day==4
      "Thursday"
    elsif day==5
      "Friday"
    elsif day==6
      "Saturday"         
    end
  end
  
  def nextDayOpen(day)
    #currentDay1=currentDay
    if $freeDays[currentDay(day+1)]==false
      day+1
    else 
      nextDayOpen(day+1)
    end
  end

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
      @minutes=@currentMinute+((@currentHour*60+@pickup)%60)
      if @minutes>=60
        @minutes-=60
        @hours+=1
      end
      return @hour,@minutes, "Today"
    
    elsif Time.new.wday==0 and $freeDays["Sunday"]==true
      notToday
      return @hours,@minutes,currentDay(nextDayOpen(0))
    
    elsif Time.new.wday==1 and $freeDays["Monday"]==true
      notToday
      return @hours,@minutes,currentDay(nextDayOpen(1))
    
    elsif Time.new.wday==2 and $freeDays["Tuesday"]==true
      notToday
      return @hours,@minutes,currentDay(nextDayOpen(2))
    
    elsif Time.new.wday==3 and $freeDays["Wednesday"]==true
      notToday
      return @hours,@minutes,currentDay(nextDayOpen(3))
    
    elsif Time.new.wday==4 and $freeDays["Thursday"]==true
      notToday
      return @hours,@minutes,currentDay(nextDayOpen(4))
    
    elsif Time.new.wday==5 and $freeDays["Friday"]==true
      notToday
      return @hours,@minutes,currentDay(nextDayOpen(5))
    elsif Time.new.wday==6 and $freeDays["Saturday"]==true
      notToday
      return @hours,@minutes,currentDay(nextDayOpen(6))
    
    
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
  def notToday
    @minutes=(@currentMinute+(@open*60+(@pickup-(@close*60-@currentHour*60)))%60)
    @hours=(@open*60+(@pickup-(@close*60-@currentHour*60)))/60
    if @minutes>=60
      @minutes-=60
      @hours+=1
    end
  end
end




