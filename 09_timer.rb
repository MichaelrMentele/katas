class Timer

	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		minutes = seconds/60 
		hours = minutes/60
		seconds = @seconds%60 
		minutes %= 60
		hours %= 60
		return padded(hours) + ':' + padded(minutes) + ':' + padded(seconds)
	end

	def padded(time_num)
		if time_num < 10
			return '0' + time_num.to_s
		else
			return time_num.to_s
		end
	end

end