require_relative 'validation.rb'
#require 'ui'

#--------------------------------------------
class Order
  $free_days={"Sunday" => true,"Monday"=>false,"Tuesday"=>false,"Wednesday"=>false,"Thursday"=>false,"Friday"=>false,"Saturday"=>true}
  attr_accessor :open, :close, :pickup
    def current_day(day)
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
    elsif day==7
      "Sunday"        
    end
  end
  
  def next_day_open(day)
    #current_day1=current_day
    if day==7
      day=0
    end
    if $free_days[current_day(day+1)]==false
      day+1
    else 
      next_day_open(day+1)
    end
  end

  def init(open,close,pickup)
    self.open=open
    self.close=close
    self.pickup=pickup
  end

  def getTime
    Time.new.hour
  end

  def toString
    print self.open,' ',self.close,' ',self.pickup
  end

  def returnValues
    return self.open,self.close,self.pickup
  end

  def calculate(day)
    if day
      @hours=(Time.new.hour*60+self.pickup)/60
      @minutes=Time.new.min+((Time.new.hour*60+self.pickup)%60)
      if @minutes>=60
        @minutes-=60
        @hours+=1
      end
      return @hours,@minutes, "Today"
    elsif $free_days[current_day(Time.new.wday)]==false
      notToday
      return @hours,@minutes,current_day(next_day_open(Time.new.wday))
    # elsif Time.new.wday==0 and $free_days["Sunday"]==false
      # notToday
      # return @hours,@minutes,current_day(next_day_open(0))
#     
    # elsif Time.new.wday==1 and $free_days["Monday"]==false
      # notToday
      # return @hours,@minutes,current_day(next_day_open(1))
#     
    # elsif Time.new.wday==2 and $free_days["Tuesday"]==false
      # notToday
      # return @hours,@minutes,current_day(next_day_open(2))
#     
    # elsif Time.new.wday==3 and $free_days["Wednesday"]==false
      # notToday
      # return @hours,@minutes,current_day(next_day_open(3))
#     
    # elsif Time.new.wday==4 and $free_days["Thuesday"]==false
      # notToday
      # return @hours,@minutes,current_day(next_day_open(4))
#     
    # elsif Time.new.wday==5 and $free_days["Friday"]==false
      # notToday
      # return @hours,@minutes,current_day(next_day_open(5))
    # elsif Time.new.wday==6 and $free_days["Saturday"]==false
      # notToday
      # return @hours,@minutes,current_day(next_day_open(6))
#     
    
    else
            return "H","M","Closed!!!"
    end
  end
  def notToday
    @minutes=(Time.new.min+(self.open*60+(self.pickup-(self.close*60-Time.new.hour*60)))%60)
    @hours=(self.open*60+(self.pickup-(self.close*60-Time.new.hour*60)))/60
    if @minutes>=60
      @minutes-=60
      @hours+=1
    end
  end
end




