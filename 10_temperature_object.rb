class Temperature

	attr_accessor :f, :c

	#for each argument when intialized set if value was provided
	def initialize temperature_type
		temperature_type.each do | temp_type, value |
			instance_variable_set("@#{temp_type}", value) unless value.nil?
		end
	end

	#factory methods
	def self.from_celsius(temp_in_c)
		self.new(c: temp_in_c)
	end

	def self.from_fahrenheit(temp_in_f)
		self.new(f: temp_in_f)
	end

	#return temp and perform conversion if needed
	def in_celsius
		@c.nil? ? ftoc(@f) : @c
	end

	def in_fahrenheit
		@f.nil? ? ctof(@c) : @f
	end

	#temp conversions
	def ftoc(temp_fahrenheit)
		celsius = (temp_fahrenheit - 32) * 5/9.0
	end

	def ctof(temp_celsius)
		fahrenheit = (temp_celsius) * 9.0/5 + 32
	end

end

class Celsius < Temperature
	def initialize temp
		@c = temp
	end

end

class Fahrenheit < Temperature
	def initialize temp
		@f = temp
	end
	
end
# a = Temperature.new(:f => 50).in_fahrenheit
# puts a
