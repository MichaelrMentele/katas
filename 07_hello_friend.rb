class Friend
	#attr_accessor :who

	def greeting(who=nil)
		if who == nil
			'Hello!' 
		else
			'Hello, ' + who + '!'
		end
	end
end
