require 'rest_client'
require 'logger'

class SmartBuffer

  def initialize(max_buffer_size=100)
    @max_buffer_size = max_buffer_size
    @buffer = []
    @logger = Logger.new('logs/queue.log')
  end

  def enqueue(message)
    @buffer.push(message)
    if full?
      raise "buffer full, oh noes!"
    else
      @logger.info("Enqueued a message - #{@buffer.count} Messages in Buffer")
    end
  end

  def dequeue
    message = @buffer.shift
    @logger.log("Enqueued a message - #{@buffer.count} Messages in Buffer")
    message
  end

  def size
    @buffer.count
  end

  def full?
    @buffer.count > @max_buffer_size
  end

  def empty?
    @buffer.empty?
  end
end

buffer = SmartBuffer.new

poller = Thread.new do
  loop do
    message = RestClient.get 'http://message-provider.herokuapp.com/get_message'
    buffer.enqueue message
    puts "pulled a message - current buffer size: #{buffer.size}"
    sleep 0.5
  end
end

processor = Thread.new do
  loop do
    if !buffer.empty?
      message = buffer.dequeue
      puts "processed a message - current buffer size: #{buffer.size}"
      sleep [0.1, 1.1].sample
    end
  end
end

[poller, processor].each(&:join)
