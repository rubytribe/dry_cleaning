puts "Opening Time: "
open_time = gets.chomp.to_i * 60
puts "Closing Time: "
close_time = gets.chomp.to_i * 60
puts "Duration of washing cycle in minutes:"
wash_cycle = gets.chomp.to_i 
while wash_cycle > 120
  puts "Please enter the correct time!!" 
  wash_cycle = gets.chomp.to_i 
end
#puts "#{open_time}, #{close_time}, #{wash_cycle}"


  def getCurrentDate
    
    time1 = Time.new #Time.mktime(2014,7,11,17,38,25)
    @current_year = time1.year    # => Year of the date 
    @current_month = time1.month   # => Month of the date (1 to 12)
    @current_day = time1.day     # => Day of the date (1 to 31 )
    @current_week_day = time1.wday    # => 0: Day of week: 0 is Sunday => 5 is Friday
    @current_year_day = time1.yday    # => 365: Day of year
    @current_hour = time1.hour    # => 23: 24-hour clock
    @current_min = time1.min     # => 59
  end
  
  
  
   def setMonth(m)
    if m == 1
      month = "January"
    elsif m == 2
      month = "February"
    elsif m == 3
      month = "March"
    elsif m == 4
      month = "April"
    elsif m == 5
      month = "May"
    elsif m == 6
      month = "June"
    elsif m == 7
      month = "July"
    elsif m == 8
      month = "August"
    elsif m == 9
      month = "September"
    elsif m == 10
      month = "October"
    elsif m == 11
      month = "November"
    elsif m == 12
      month = "December"
    else
      puts "The month does not exist!"
    end
    month
  end
  
  def setDay(x)
    if x == 1
      week_day = "Monday"
    elsif x == 2
      week_day = "Tuesday"
    elsif x == 3
      week_day = "Wednesday"
    elsif x == 4
      week_day = "Thursday"
    elsif x == 5
      week_day = "Friday"
    else
      puts "Sorry, we're Closed!"
    end
    week_day
  end
  
  def hoursToMinutes
    hours = @current_hour
    minutes = @current_min
    @transf_min = hours*60 + minutes
    @transf_min
  end
  
  def months1 
    # if month is January, March, May, July, August,October or December
    if @current_month.in?[1,3,5,7,8,10,12]
      puts "Months1"
      @current_month
    end
  end
  
  def months2
    # if month is April, June, September or November
    if @current_month.in?[4,6,9,11]
      puts "Months2"
      @current_month
    end
  end
  
  def months3
    # if month is April, June, September or November
    if @current_month == 2
      puts "Months3"
      @current_month
    end
  end
  
  


getCurrentDate
puts "The clothes were brought in #{setDay(@current_week_day)}, #{setMonth(@current_month)} #{@current_day} at #{@current_hour}:#{@current_min} " unless @current_wday == 6 || @current_wday == 0 || hoursToMinutes > close_time

if (@current_week_day >= 1) && (@current_week_day <= 5) && (hoursToMinutes >= open_time) && (hoursToMinutes <= (close_time - wash_cycle))
  puts "You can pick up your clothes #{setDay(@current_week_day)}, #{setMonth(@current_month)} #{@current_day} at #{(hoursToMinutes + wash_cycle)/60}:#{(hoursToMinutes + wash_cycle) % 60}"
elsif (@current_week_day >= 1) && (@current_week_day <= 4) && (hoursToMinutes > (close_time - wash_cycle) && (hoursToMinutes<= close_time))
  puts "You can pick up your clothes #{setDay(@current_week_day+1)}, #{setMonth(@current_month)} #{@current_day + 1} at #{(open_time + (wash_cycle - (close_time - hoursToMinutes))) / 60}:#{(open_time + (wash_cycle - (close_time - hoursToMinutes))) % 60}"
elsif hoursToMinutes > close_time
  puts "Sorry, We're Closed!"
elsif @current_week_day == 6 || @current_week_day == 0
  puts "Sorry, We're Closed! It's Weekend!!"
elsif @current_week_day == 5 && (hoursToMinutes > (close_time - wash_cycle) && (hoursToMinutes<= close_time))
  puts "You can pick up your clothes #{setDay(1)}, #{setMonth(@current_month)} #{@current_day + 3} at #{(open_time + (wash_cycle - (close_time - hoursToMinutes))) / 60}:#{(open_time + (wash_cycle - (close_time - hoursToMinutes))) % 60}"
end




