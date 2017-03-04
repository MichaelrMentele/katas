class Array
	
	def sum
		sum = 0
		self.each do |element|
			sum += element
		end
		sum
	end

	def square
		self.map do |element|
			element *= element
		end
	end

	def square!
		self.each_index do |i|
			self[i] *= self[i]
		end
		self
	end
end