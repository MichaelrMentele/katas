class Palindrome
  def self.check(str)
    dequeue = str.downcase.split("")
    while dequeue.length > 1
      return false unless dequeue.pop == dequeue.shift
    end
    return true
  end
end
