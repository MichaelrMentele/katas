class Logger
# we need to store the latest time stamp for each message passed in
# this sounds like a hash, whenever should_print_message is called, we check
# whether the new timestamp is greater than 10 of the old timestamp for that message
    attr_accessor :log
=begin
    Initialize your data structure here.
=end
    def initialize()
        @log = {}
    end


=begin
    Returns true if the message should be printed in the given timestamp, otherwise returns false.
        If this method returns false, the message will not be printed.
        The timestamp is in seconds granularity.
    :type timestamp: Integer
    :type message: String
    :rtype: Boolean
=end
    def should_print_message(timestamp, message)
        # if it's been logged in the last 10 seconds, return false
        # other wise, set the new timestamp and return true
        if recently_logged(timestamp, message)
            return false
        else
            log[message] = timestamp
            return true
        end

    end

    private

    def recently_logged(timestamp, message)
        if log.has_key?(message)
            return (timestamp - log[message]) < 10
        else
            return false
        end
    end
end

# Your Logger object will be instantiated and called as such:
# obj = Logger.new()
# param_1 = obj.should_print_message(timestamp,message)
