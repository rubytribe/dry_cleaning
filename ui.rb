load 'DryClean.rb'

class Ui
  def runUi
    print "Open="
    @openHour=gets.chomp.to_i
    #puts ''
    print "Close="
    @closeHour=gets.chomp.to_i
    
    print "Pickup time(hours)="
    @pickupTime=gets.chomp.to_i
    print "Pickup time(minutes)="
    @pickupTimeMin=gets.chomp.to_i
    
    @pick=@pickupTime*60 + @pickupTimeMin
    

    if self.validation
      o=Order.new
      o.init(@openHour,@closeHour,@pick)
      o.getTime
      print "time is:",o.calculate((o.getTime*60+@pick)<@closeHour*60)
    end

  end

  def validation
    v=Validator.new
    if !v.openCloseValid(@openHour,@closeHour)
      print "Error! You can't open after closing hour!!"
    elsif !v.pickupValid(@pick)
      print "Error! check pickup time"
    elsif v.isClosed(@closeHour,Time.new.hour,Time.new.min)
      print "Is closed"
    else true
    end
  end
end



ui=Ui.new
ui.runUi