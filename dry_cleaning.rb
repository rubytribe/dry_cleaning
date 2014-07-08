class DryClean
	private
	$currentTime 
	private
	$deliveryTime 

	#for testing
	def self.setDryClean(sTime)
		$currentTime = sTime
		$deliveryTime = sTime
	end

	def self.startDryClean
		$currentTime = Time.new
		$deliveryTime = $currentTime
	end
	#mon - fri 10 - 18
	def self.getOrder
		if isOpen($currentTime)
			placeOrder
		else
			puts "closed"
			exit
		end
		return $deliveryTime
	end

	def self.isOpen(time)
		if time.sunday? or time.saturday?
			return false
		end

		if time.hour < 10 or time.hour > 18
			return false
		end

		return true
	end


	private
	def self.placeOrder
		eod = $deliveryTime
		eod = Time.mktime($deliveryTime.year, $deliveryTime.month, $deliveryTime.day, 18, 0, 0)
		order = 2*3600
		
		if($deliveryTime + order > eod)
			order -= (eod - $deliveryTime)
			nextDay	
		end
		$deliveryTime += order

	end

	private
	def self.nextDay
		if $deliveryTime.friday?
			$deliveryTime += 3 * 24 * 3600
			$deliveryTime = Time.mktime($deliveryTime.year, $deliveryTime.month, $deliveryTime.day, 10, 0, 0)
		else
			$deliveryTime += 1 * 24 * 3600
			$deliveryTime = Time.mktime($deliveryTime.year, $deliveryTime.month, $deliveryTime.day, 10, 0, 0)
		end
		
	end

	def self.passHours(nrHours) #for testing
		if nrHours > 0
			$currentTime += nrHours 
		end
		if $deliveryTime < $currentTime
			$deliveryTime = $currentTime
		end
		
	end

	def self.getDeliveryTime
		return $deliveryTime
	end

	def self.getCurrentTime
		return $currentTime
	end
end




#DryClean.startDryClean
#DryClean.passHours(3 * 24 * 60 * 60 + 8 * 60 * 60)
#puts DryClean.getOrder

class Test
	def self.testMonday
		#before 16
		DryClean.setDryClean(Time.mktime(2014, 7, 14, 13, 23, 0))
		puts "Client on monday. \n	Arriving time: #{DryClean.getCurrentTime}"
		DryClean.getOrder
		puts "	Please come back at #{DryClean.getDeliveryTime}"

		#after 16
		DryClean.passHours(4 * 60 * 60)
		puts "Client on monday. \n	Arriving time: #{DryClean.getCurrentTime}"
		DryClean.getOrder
		puts "	Please come back at #{DryClean.getDeliveryTime}"
	end

	def self.testFriday
		#before 16
		DryClean.setDryClean(Time.mktime(2014, 7, 18, 13, 23, 0))
		puts "Client on friday. \n	Arriving time: #{DryClean.getCurrentTime}"
		DryClean.getOrder
		puts "	Please come back at #{DryClean.getDeliveryTime}"

		puts "Client on friday. \n	Arriving time: #{DryClean.getCurrentTime}"
		DryClean.getOrder
		puts "	Please come back at #{DryClean.getDeliveryTime}"

		puts "Client on friday. \n	Arriving time: #{DryClean.getCurrentTime}"
		DryClean.getOrder
		puts "	Please come back at #{DryClean.getDeliveryTime}"

		puts "Client on friday. \n	Arriving time: #{DryClean.getCurrentTime}"
		DryClean.getOrder
		puts "	Please come back at #{DryClean.getDeliveryTime}"

		puts "Client on friday. \n	Arriving time: #{DryClean.getCurrentTime}"
		DryClean.getOrder
		puts "	Please come back at #{DryClean.getDeliveryTime}"

		DryClean.passHours(3 * 24 * 60 * 60)

		
		puts "Client on friday. \n	Arriving time: #{DryClean.getCurrentTime}"
		DryClean.getOrder
		puts "	Please come back at #{DryClean.getDeliveryTime}"
	end

	def self.testSunday
		DryClean.setDryClean(Time.mktime(2014, 7, 20, 13, 23, 0))
		puts "Client on sunday. \n	Arriving time: #{DryClean.getCurrentTime}"
		DryClean.getOrder
	end

end

Test.testMonday
Test.testFriday
Test.testSunday