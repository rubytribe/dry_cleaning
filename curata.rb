$opening_hour=8
$closing_hour=20



class Spalatorie
	attr_accessor:durata
	attr_accessor:time
	attr_accessor:returntime
	def initialize(time_necesar,time_comanda)
		@durata=time_necesar*60
		@time=time_comanda
		@returntime=@time+@durata
	end


=begin
	verifica urmatoarele lucruri:
		1.daca spalatoria este deschisa
		2.daca se poate realiza job-ul in ziua curenta
		3.daca ziua curenta nu este vineri
=end
	
	def check_time()
	
		unless check_validity==false
			if @returntime.friday? and @returntime.hour >= $closing_hour
				weekend(@returntime)

			elsif @returntime.hour >= $closing_hour or @returntime.hour<$opening_hour
				tomorrow(@returntime)
			else
				print_current_day(@returntime)
			end
	  end
	end





	

private
def check_validity()
	if $closing_hour<$opening_hour
		puts "The opening and closing hour are not fine defined"
		return false
	end
=begin
	if @@durata>7200
		puts "The maximum time for cleaning is 2 hour(120 minutes)"
		return false
	end
=end
	if @time.hour>=$closing_hour or @time.hour<$opening_hour
	  puts "Please come to put the command in the orar interval 8 am - 20 pm"
	  return false
	end
end


	def weekend(returntime)
		computes(3)
	end

	def tomorrow(returnt)
		computes(1)
	end
	
	
	def print_current_day(durata)
		puts "you can come back at #@returntime"
	end

	def computes(i)
		@@dif_h=@returntime.hour-$closing_hour
		@@dif_min=@returntime.min
		@@dif_sec=@returntime.sec
		@returntime=@returntime+i*24*60*60
		@returntime=Time.mktime(@returntime.year,@returntime.month,@returntime.day,@@dif_h+8,@@dif_min,@@dif_sec)
		puts "you can come back at #@returntime"
	end

end

#the initialize time is in minutes
spal=Spalatorie.new(110,Time.mktime(2014,7,11,19,0,0))
spal.check_time()