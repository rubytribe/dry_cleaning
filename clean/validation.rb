#puts "validation included"

class Validator
  def openCloseValid(open,close)
    open<close
  end

  def pickupValid(pickup)
    pickup<=120 and pickup>0
  end

  def todayValid(close,pickup,current)
    close>current+pickup
  end
  
  def isClosed(close, current)
    close < current
  end

end
