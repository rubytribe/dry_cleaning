
class DryClean
	
	private
	@currentTime 
	private
	@deliveryTime 

	#for testing
	def $dry.setDryClean(sTime)
		@currentTime = sTime
		@deliveryTime = sTime
	end

	def $dry.startDryClean
		@currentTime = Time.new
		@deliveryTime = @currentTime
	end
	#mon - fri 10 - 18
	def $dry.getOrder
		if isOpen(@currentTime)
			placeOrder
		else
			puts "closed"
			exit
		end
		return @deliveryTime
	end

	def $dry.isOpen(time)
		if time.sunday? or time.saturday?
			return false
		end

		if time.hour < 10 or time.hour > 18
			return false
		end

		return true
	end


	private
	def $dry.placeOrder
		eod = @deliveryTime
		eod = Time.mktime(@deliveryTime.year, @deliveryTime.month, @deliveryTime.day, 18, 0, 0)
		order = 2*3600
		
		if(@deliveryTime + order > eod)
			order -= (eod - @deliveryTime)
			nextDay	
		end
		@deliveryTime += order

	end

	private
	def $dry.nextDay
		if @deliveryTime.friday?
			@deliveryTime += 3 * 24 * 3600
			@deliveryTime = Time.mktime(@deliveryTime.year, @deliveryTime.month, @deliveryTime.day, 10, 0, 0)
		else
			@deliveryTime += 1 * 24 * 3600
			@deliveryTime = Time.mktime(@deliveryTime.year, @deliveryTime.month, @deliveryTime.day, 10, 0, 0)
		end
		
	end

	def $dry.passHours(nrHours) #for testing
		if nrHours > 0
			@currentTime += nrHours 
		end
		if @deliveryTime < @currentTime
			@deliveryTime = @currentTime
		end
		
	end

	def $dry.getDeliveryTime
		return @deliveryTime
	end

	def $dry.getCurrentTime
		return @currentTime
	end
end




#$dry.startDryClean
#$dry.passHours(3 * 24 * 60 * 60 + 8 * 60 * 60)
#puts $dry.getOrder

class Test
	def $dry.testMonday
		#before 16
		$dry.setDryClean(Time.mktime(2014, 7, 14, 13, 23, 0))
		puts "Client on monday. \n	Arriving time: #{$dry.getCurrentTime}"
		$dry.getOrder
		puts "	Please come back at #{$dry.getDeliveryTime}"

		#after 16
		$dry.passHours(4 * 60 * 60)
		puts "Client on monday. \n	Arriving time: #{$dry.getCurrentTime}"
		$dry.getOrder
		puts "	Please come back at #{$dry.getDeliveryTime}"
	end

	def $dry.testFriday
		#before 16
		$dry.setDryClean(Time.mktime(2014, 7, 18, 13, 23, 0))
		puts "Client on friday. \n	Arriving time: #{$dry.getCurrentTime}"
		$dry.getOrder
		puts "	Please come back at #{$dry.getDeliveryTime}"

		puts "Client on friday. \n	Arriving time: #{$dry.getCurrentTime}"
		$dry.getOrder
		puts "	Please come back at #{$dry.getDeliveryTime}"

		puts "Client on friday. \n	Arriving time: #{$dry.getCurrentTime}"
		$dry.getOrder
		puts "	Please come back at #{$dry.getDeliveryTime}"

		puts "Client on friday. \n	Arriving time: #{$dry.getCurrentTime}"
		$dry.getOrder
		puts "	Please come back at #{$dry.getDeliveryTime}"

		puts "Client on friday. \n	Arriving time: #{$dry.getCurrentTime}"
		$dry.getOrder
		puts "	Please come back at #{$dry.getDeliveryTime}"

		$dry.passHours(3 * 24 * 60 * 60)

		
		puts "Client on friday. \n	Arriving time: #{$dry.getCurrentTime}"
		$dry.getOrder
		puts "	Please come back at #{$dry.getDeliveryTime}"
	end

	def $dry.testSunday
		$dry.setDryClean(Time.mktime(2014, 7, 20, 13, 23, 0))
		puts "Client on sunday. \n	Arriving time: #{$dry.getCurrentTime}"
		$dry.getOrder
	end

end
@dry = DryClean.new
$dry.testMonday
$dry.testFriday
$dry.testSunday