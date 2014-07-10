


class Cleaning
	attr_accessor:durata
	attr_accessor:time
	attr_accessor:returntime
	attr_accessor:opening_hour
	attr_accessor:closing_hour
	attr_accessor:free_time


	def initialize(necesary_time,opening_hour=8,closing_hour=16)
		@opening_hour=opening_hour
		@closing_hour=closing_hour
		@lenght=necesary_time*60
		@time=Time.mktime(2016,9,29,14,0,0)
		@returntime=@time+@lenght
		@free_time=Time.mktime(2016,9,30,8,0,0)
	end


	def opening_hour=(hour)
		@opening_hour=hour
	end
	def closing_hour=(hour)
		@closing_hour=(hour)
	end
		
=begin
	verifica urmatoarele lucruri:
		1.daca spalatoria este deschisa
		2.daca se poate realiza job-ul in ziua curenta
		3.daca ziua curenta nu este vineri
=end

	def check_time()
		unless check_validity==false
			if @returntime.friday? and @returntime.hour >= @closing_hour
				computes(3)

			elsif @returntime.hour >= @closing_hour or @returntime.hour<@opening_hour
				computes(1)
			else
				print_current_day(@returntime)
			end
	  end
	end



private
def check_validity()
	unless @closing_hour==0
		if @time.day===@free_time.day
			puts "Today is a free day! It's closed!"
			return false
		end

		if @closing_hour<@opening_hour
			puts "The opening and closing hour are not fine defined"
			return false
		end
		if @time.hour<@opening_hour or @time.hour>@closing_hour
			puts "Closed"
			return false
		end
		if @lenght>7200
			puts "The maximum time for cleaning is 2 hour(120 minutes)"
			return false
		end
	end
end
	


	def print_current_day(durata)
		puts "you can come back at #@returntime"
	end




	def computes(i)
		dif_h=@returntime.hour-@closing_hour
		puts dif_h
		dif_min=@returntime.min
		dif_sec=@returntime.sec
		@returntime=@returntime+i*24*60*60
		if @returntime.day==@free_time.day and @free_time.friday?
			@returntime=@returntime+3*24*60*60
		end
		if @returntime.day==@free_time.day
			@returntime=@returntime+1*24*60*60
		end
		@returntime=Time.mktime(@returntime.year,@returntime.month,@returntime.day,dif_h+8,dif_min,dif_sec)	
		puts "you can come back at #{@returntime}"
	end

end

