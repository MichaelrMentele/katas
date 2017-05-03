class MovingAverage

=begin
    Initialize your data structure here.
    :type size: Integer
=end
    def initialize(size)
        # we use a queue of size 'size'
        # or could keep all values using a doubly linked list
        @queue = []
        @window = size
    end


=begin
    :type val: Integer
    :rtype: Float
=end
    def next(val)
        if @queue.length == @window
            @queue.shift
        end
        @queue.push(val)
        sum = @queue.inject(0.0) { |sum, n| sum + n}

        return sum / @queue.length
    end


end

# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage.new(size)
# param_1 = obj.next(val)
