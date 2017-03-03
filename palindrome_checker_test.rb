require 'minitest/autorun'
require_relative 'palindrome_checker'

class PalindromeTest < MiniTest::Unit::TestCase

  def test_palindrome
    assert Palindrome.check("tattarrattat")
    refute Palindrome.check("tatssssdttat")
    assert Palindrome.check("deed")
    assert Palindrome.check("radar")
    assert Palindrome.check("Radar")
    refute Palindrome.check("sports")
    refute Palindrome.check("ab")
    assert Palindrome.check("a")
  end

end
