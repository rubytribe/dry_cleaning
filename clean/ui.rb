require_relative 'DryClean.rb'
require 'colorize'

class Ui 
  attr_accessor :close_hour, :open_hour, :pick
  
  def initialize(open_h,close_h)
    self.open_hour=open_h
    self.close_hour=close_h
  end
  
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
    $free_days.each {|day, bool|
      print "#{day} ".red unless bool==false
    }
    puts ""
    
    case free_daysMenu
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
    $free_days.each {|day, bool|
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
      $free_days["Sunday"]=true
    when 2
      $free_days["Monday"]=true
    when 3
      $free_days["Tuesday"]=true
    when 4
      $free_days["Wednesday"]=true
    when 5
      $free_days["Thursday"]=true
    when 6
      $free_days["Friday"]=true
    when 7
      $free_days["Saturday"]=true
    end
    puts "\e[H\e[2J"
    freeTime
  end
  def removeFreeDay
    number=1;
    $free_days.each {|day, bool|
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
      $free_days["Sunday"]=false
    when 2
      $free_days["Monday"]=false
    when 3
      $free_days["Tuesday"]=false
    when 4
      $free_days["Wednesday"]=false
    when 5
      $free_days["Thursday"]=false
    when 6
      $free_days["Friday"]=false
    when 7
      $free_days["Saturday"]=false
    end
    puts "\e[H\e[2J"
    freeTime
  end
  def free_daysMenu
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
    self.open_hour=gets.chomp.to_i
    print "Close="
    self.close_hour=gets.chomp.to_i
    #puts "\e[H\e[2J"
    runUi
  end
  
  def placeOrder
    #puts "\e[H\e[2J"
    print "New Order:"
    
    #print "Pickup time(hours)="
    @pickup_time=0
    print "Pickup time(minutes)="
    @pickup_time_min=gets.chomp.to_i
    
    self.pick=@pickup_time_min
    

    if self.validation
      o=Order.new
      o.init(self.open_hour,self.close_hour,self.pick)
      o.getTime
      a=o.calculate((Time.new.hour*60+Time.new.min+pick)<close_hour*60)
      
      puts "------------------------------------"
      print "Come back ".red,a[2]," at ".red,a[0],":",a[1],"\n"
      puts "------------------------------------"
      
    end
    gets.chomp
    #puts "\e[H\e[2J"
    runUi
  end

  def validation
    v=Validator.new
    if !v.openCloseValid(self.open_hour,self.close_hour)      
      puts "Error! You can't open after closing hour!!".red
    elsif !v.pickupValid(self.pick)
      puts "Error! check pickup time".red
    elsif v.isClosed(self.close_hour,Time.new.hour)
      puts "Is closed".red
    else true
    end
  end
  
  def menu
    puts "\e[H\e[2J"
    puts "-----RUBY TRIBE'S DRY CLEANING-----"
    puts "-----------------------------------"
    puts "1. Place order"
    puts "2. Set working program(#{self.open_hour}-#{self.close_hour} now)"
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
