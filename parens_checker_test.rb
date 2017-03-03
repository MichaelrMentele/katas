require 'minitest/autorun'
require_relative 'parens_checker'

class ParensCheckerTest < MiniTest::Unit::TestCase

  def test_is_balanced_only_open
    pc = ParensChecker.new("(")
    refute pc.balanced?
    pc = ParensChecker.new("((")
    refute pc.balanced?
    pc = ParensChecker.new("(a")
    refute pc.balanced?
    pc = ParensChecker.new("(]")
    refute pc.balanced?
  end

  def test_is_balanced_only_close
    pc = ParensChecker.new("]}")
    refute pc.balanced?
  end

  def test_is_balanced_single_symbol
    pc = ParensChecker.new("()")
    assert pc.balanced?
    pc = ParensChecker.new("(a)")
    assert pc.balanced?
    pc = ParensChecker.new("()()")
    assert pc.balanced?
    pc = ParensChecker.new("())")
    refute pc.balanced?
    pc = ParensChecker.new("(a)(b)")
    assert pc.balanced?
  end

  def test_is_balanced_multiple_symbols
    pc = ParensChecker.new("{()}{()}")
    assert pc.balanced?
    pc = ParensChecker.new("{(X)[XY]}")
    assert pc.balanced?
    pc = ParensChecker.new("(][)")
    refute pc.balanced?
  end

  def test_no_parens
    pc = ParensChecker.new("GOTEALEAF")
    assert pc.balanced?
  end

end
