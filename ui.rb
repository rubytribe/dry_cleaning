load 'DryClean.rb'
require 'colorize'

class Ui
  @@closeHour=17
  @@openHour=8
  @@pick=0
  #@@pickupTime=0
  #@@pickupTimeMin=0

  def runUi
    puts "\e[H\e[2J"
    case menu
    when 1
      puts "\e[H\e[2J"
      placeOrder
    when 2
      puts "\e[H\e[2J"
      workTime
    when 3
      puts "\e[H\e[2J"
      freeTime
    when 0
      puts "\e[H\e[2J"
      exit
    end
  end
  
  def freeTime
    print "Free days:"
    $freeDays.each {|day, bool|
      print "#{day} ".red unless bool==false
    }
    puts ""
    
    case freeDaysMenu
    when 1
      addFreeDay
    when 2
      removeFreeDay
    when 3
      runUi
    end
    #puts "\e[H\e[2J"
    runUi
  end
  
  def addFreeDay
    number=1;
    $freeDays.each {|day, bool|
      print number,":#{day} ".red
      number+=1
    }
    puts ""
    selection=0
    while (selection<=0)or(selection>7) 
      print "Input the command:"
      selection=gets.chomp.to_i
    end
    puts "------------------------------------"
    case selection 
    when 1
      $freeDays["Sunday"]=true
    when 2
      $freeDays["Monday"]=true
    when 3
      $freeDays["Tuesday"]=true
    when 4
      $freeDays["Wednesday"]=true
    when 5
      $freeDays["Thursday"]=true
    when 6
      $freeDays["Friday"]=true
    when 7
      $freeDays["Saturday"]=true
    end
    puts "\e[H\e[2J"
    freeTime
  end
  def removeFreeDay
    number=1;
    $freeDays.each {|day, bool|
      print number,":#{day} ".red
      number+=1
    }
    puts ""
    selection=0
    while (selection<=0)or(selection>7) 
      print "Input the command:"
      selection=gets.chomp.to_i
    end
    puts "------------------------------------"
    case selection 
    when 1
      $freeDays["Sunday"]=false
    when 2
      $freeDays["Monday"]=false
    when 3
      $freeDays["Tuesday"]=false
    when 4
      $freeDays["Wednesday"]=false
    when 5
      $freeDays["Thursday"]=false
    when 6
      $freeDays["Friday"]=false
    when 7
      $freeDays["Saturday"]=false
    end
    puts "\e[H\e[2J"
    freeTime
  end
  def freeDaysMenu
    puts "------------------------------------"
    puts "1. Add free day"
    puts "2. Remove free day"
    puts "3. Go back to main menu"
    puts "------------------------------------"
    selection=0
    while (selection<=0)or(selection>3) 
      print "Input the command:"
      selection=gets.chomp.to_i
    end
    puts "------------------------------------"
    selection
  end
  
  def workTime
    print "Working program:"
    #puts "\e[H\e[2J"
    print "Open="
    @@openHour=gets.chomp.to_i
    print "Close="
    @@closeHour=gets.chomp.to_i
    #puts "\e[H\e[2J"
    runUi
  end
  
  def placeOrder
    #puts "\e[H\e[2J"
    print "New Order:"
    
    print "Pickup time(hours)="
    @pickupTime=gets.chomp.to_i
    print "Pickup time(minutes)="
    @pickupTimeMin=gets.chomp.to_i
    
    @@pick=@pickupTime*60 + @pickupTimeMin
    

    if self.validation
      o=Order.new
      o.init(@@openHour,@@closeHour,@@pick)
      o.getTime
      a=o.calculate((o.getTime*60+@@pick)<@@closeHour*60)
      
      puts "------------------------------------"
      print "Come back ".red,a[2]," at ".red,a[0],":",a[1],"\n"
      puts "------------------------------------"
      gets.chomp
    end
    #puts "\e[H\e[2J"
    runUi
  end

  def validation
    v=Validator.new
<<<<<<< HEAD
    if !v.openCloseValid(@@openHour,@@closeHour)
      
      puts "Error! You can't open after closing hour!!".red
    elsif !v.pickupValid(@@pick)
      puts "Error! check pickup time".red
    elsif v.isClosed(@@closeHour,Time.new.hour)
      puts "Is closed".red
=======
    if !v.openCloseValid(@openHour,@closeHour)
      print "Error! You can't open after closing hour!!"
    elsif !v.pickupValid(@pick)
      print "Error! check pickup time"
    elsif v.isClosed(@closeHour,Time.new.hour,Time.new.min)
      print "Is closed"
>>>>>>> e3e0153eb1d6606829c686c00278849039cf3088
    else true
    end
  end
  
  def menu
    puts "\e[H\e[2J"
    puts "-----RUBY TRIBE'S DRY CLEANING-----"
    puts "-----------------------------------"
    puts "1. Place order"
    puts "2. Set working program(#{@@openHour}-#{@@closeHour} now)"
    puts "3. Set free days"
    puts "                "
    puts "0. Exit"
    puts "-----------------------------------"
    selection=-1
    while (selection<0)or(selection>3) 
      print "Input the command:"
      selection=gets.chomp.to_i
    end
    puts "-----------------------------------"
    selection
  end
end



ui=Ui.new
ui.runUi