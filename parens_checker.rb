class ParensChecker
  OPEN = "([{<"
  CLOSE = ")]}>"

  def initialize(str)
    @str = str
  end

  def balanced?
    stack = []
    @str.each_char do |chr|
      if OPEN.include?(chr)
        stack.push(chr)
      elsif CLOSE.include?(chr)
        return false if stack.empty?
        open_char = stack.pop
        return false unless match?(open_char, chr)
      end
    end

    stack.empty?
  end

  def match?(open_char, close_char)
    OPEN.index(open_char) == CLOSE.index(close_char)
  end
end
