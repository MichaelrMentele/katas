def measure(times_to_run = 1)
	times = []

	#get ze approximate time, is nice... 
	times_to_run.times do 
		start = Time.now 
		yield
		finish = Time.now
		times.push(finish - start)
	end
	
	#if we only got 1 time... then return it
	if times.length == 1
		return times[0]
	#if multiple times return the average
	else
		total_time = times.inject(0) {|sum, time| sum + time}
		return total_time/times.length.to_f
	end
	
end
