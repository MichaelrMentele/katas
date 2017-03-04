class RPNCalculator

  
  #note to self; stop mispelling 'initialize'
  def initialize
  	@calc_stack = []
  end

  def calc_stack
  	@calc_stack
  end

  def push(num)
  	@calc_stack[@calc_stack.length] = num
  end

   # #return value of the available value put onto the stack
  def value
  	@calc_stack[-1]
  end

  ####################
  #Quick Computation##
  ####################
  def tokens(those_dang_tokens)
  	those_dang_tokens.split.map {|token| %w(* / + -).include?(token) ? token.to_sym : token.to_i}
  end

  def evaluate(args)
  	tokens(args).each do |token| 
  		if token.class == Fixnum || token.class == Bignum
  			self.push(token)
  		elsif token == :+
  			self.plus
  		elsif token == :-
  			self.minus
  		elsif token == :*
  			self.times
  		elsif token == :/
  			self.divide
  		end
  	end
  	return value
  end

  ###############
  # Arithmetic ##
  ###############
  #pop top 2 values of stack, add them, put new value on stack 
  def plus
  	we_can_operate? do
  		@calc_stack.pop + @calc_stack.pop
    end
  end

  def minus
  	  we_can_operate? do
	  	-@calc_stack.pop + @calc_stack.pop
	  end
  end

  def times
  	we_can_operate? do
  		@calc_stack.pop * @calc_stack.pop
  	end
  end

  def divide
  	we_can_operate? do
  		(1/@calc_stack.pop.to_f)*@calc_stack.pop.to_f
  	end
  end
  
  #wrapper-ish function?
  #call operation code block, check that we have values to operate on, push result back to stack
  def we_can_operate?
  	if @calc_stack.length > 1
  		self.push(yield)
  	else
  		raise 'calculator is empty'
  	end
  end

  ###################
  #       End      ##
  ###################

end

# test = RPNCalculator.new
# test.push(2)
# test.push(3)
# test.push(4)
# test.minus
# puts test.value
# test.plus
# puts test.value
# puts test.evaluate("1 2 3 4 * +")