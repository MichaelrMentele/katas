class Bst

	attr_accessor :data, :left, :right

	def initialize(data=nil)
		@data = data
		@left = nil
		@right = nil
	end

	def insert(new_data)
		# traverse tree from top to bottom, left to right
		if new_data < self.data
			if self.left == nil 
				self.left = Bst.new(new_data)
			else 
				return self.left.insert(new_data)
			end
		elsif new_data > self.data
			if self.right == nil
				self.right = new_data
			else
				return self.right.insert(new_data)
			end
		end
	end

	def each
		arr = []
		if !self.has_left_child?
			arr.push(self.data)
		elsif self.has_left_child?
			return self.left.each
		elsif self.
			
			
		end

		# go to lower left corner and find starting point
	end

	def has_left_child?
		return self.left != nil
	end
end