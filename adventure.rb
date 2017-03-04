#adventure.rb

adventurer = Object.new


class << adventurer
	attr_accessor :location

	def look
		puts location.description
	end
end

end_of_road = Object.new

def end_of_road.description
	<< END 
	You are standing at the end of a road before a small brick building.
	Around you is a forest.  A small stream flows out of the building and
	down a gully.
	END


class ObjectBuilder
	def initialize(object)
		@object = object
	end

	def respond_to_missing? (missing_method, include_private = false)
		missing_method =~ /=\z/

	end

	def method_missing(missing_method, *args, &block)
		if respond_to_missing?(missing_method)
			method_name = missing_method.to_s.sub(/=\z/, '')
      		value       = args.first
      		ivar_name   = "@#{method_name}"
      		if value.is_a?(Proc)
      			define_code_method(method_name, ivar_name, value)
      		else
        		define_value_method(method_name, ivar_name, value)
      		end
      	else
      		super
      	end
     end

     def define_value_method(method_name, ivar_name, value)
    @object.instance_variable_set(ivar_name, value)
    @object.define_singleton_method(method_name) do
      instance_variable_get(ivar_name)
    end
  end

  def define_code_method(method_name, ivar_name, implementation)
    @object.instance_variable_set(ivar_name, implementation)
    @object.define_singleton_method(method_name) do |*args|
      instance_exec(*args, &instance_variable_get(ivar_name))
    end
  end
end

def Object(&definition)
  obj = Object.new
  obj.singleton_class.instance_exec(ObjectBuilder.new(obj), &definition)
  obj
end

adventurer = Object { |o|
  o.location = end_of_road

  attr_writer :location

  o.look = ->(*args) {
    puts location.description
  }
}
