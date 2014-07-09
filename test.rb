require_relative 'dry_cleaning'

class Test
  attr_accessor :dry
  @@client_number = 0
  #@dry = DryClean.new(Time.now)
  

  def test_monday
    #before 16
    @dry = DryClean.new(Time.mktime(2014, 7, 14, 13, 23, 0), 120 * 60)
    @@client_number += 1
    puts "Client number #{@@client_number} having a service time of #{@dry.get_service_time / 60} minutes coming on monday. \n  Arriving time: #{@dry.get_current_time}"
    @dry.get_order
    puts "  Please come back at #{@dry.get_delivery_time}"

    @dry = DryClean.new(Time.mktime(2014, 7, 14, 13, 33, 0), 60 * 60)
    @@client_number += 1
    puts "Client number #{@@client_number} having a service time of #{@dry.get_service_time / 60} minutes coming on monday. \n  Arriving time: #{@dry.get_current_time}"
    @dry.get_order
    puts "  Please come back at #{@dry.get_delivery_time}"

    #after 16
    @dry = DryClean.new(Time.mktime(2014, 7, 14, 17, 33, 0), 10 * 60)
    @@client_number += 1
    puts "Client number #{@@client_number} having a service time of #{@dry.get_service_time / 60} minutes coming on monday. \n  Arriving time: #{@dry.get_current_time}"
    @dry.get_order
    puts "  Please come back at #{@dry.get_delivery_time}"
  end

  def test_friday

    

    #before 16
    @dry = DryClean.new(Time.mktime(2014, 7, 18, 13, 23, 0), 120 * 60)
    @@client_number += 1
    puts "Client number #{@@client_number} having a service time of #{@dry.get_service_time / 60} minutes coming on friday. \n  Arriving time: #{@dry.get_current_time}"
    @dry.get_order
    puts "  Please come back at #{@dry.get_delivery_time}"

    @dry = DryClean.new(Time.mktime(2014, 7, 18, 17, 23, 0), 120 * 60)
    @@client_number += 1
    puts "Client number #{@@client_number} having a service time of #{@dry.get_service_time / 60} minutes coming on friday. \n  Arriving time: #{@dry.get_current_time}"
    @dry.get_order
    puts "  Please come back at #{@dry.get_delivery_time}"

    
  end

  def test_sunday
    @dry = DryClean.new(Time.mktime(2014, 7, 20, 13, 23, 0), 130 * 60)
    @@client_number += 1
    puts "Client number #{@@client_number} having a service time of #{@dry.get_service_time / 60} minutes coming on sunday. \n  Arriving time: #{@dry.get_current_time}"
    @dry.get_order


  end

end

test = Test.new
test.test_monday
test.test_friday
test.test_sunday