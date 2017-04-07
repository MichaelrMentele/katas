# Spec: http://coursera.cs.princeton.edu/algs4/assignments/percolation.html
#
# What is the value of the percolation threshold? Solve with a Monte Carlo simulation.
#

class Percolation 
  def initialize(n)
    # create nxn grid with all sites blocked
    grid = []
    for i in (0...n) do 
      for j in (0...n) do 
        grid[i][j] = i * 10 + j
      end
    end
  end

  def open(row, col)
    # open site (row, col) if not open
  end

  def is_open?(row, col)
    # rvalue: bool
  end

  def is_full?(row, col)
    # rvalue: bool
  end

  def number_of_opensites

  end

  def percolates?
  end
end

# if an argument is out of bounds throw an IndexOutOfBoundsException
# if open, isopen, isfull is out of bounds throw IllegalArgumentException
#
# The constructor should take time proportional to n^2, all methods should take
# constant time plus a constant num of calls to union-find methods union, find, connected, and count
#
# Initialize with all sites blocked. 
# Repeat until the system percolates:
#   choose a random site among blocked sites
#   open it
# When percolation occurs the fraction of sites opened is an estimate of the percolation threshold
#

class PercolationStats
  def initialize(n, trials)
    # throw IllegalArgumentExeception if n <= 0 or trails <= 0
  end

  def mean
  end

  def stddev
  end

  def confidence_lo
  end

  def confidence_hi
  end
end

n = ARGV[0]
t = ARGV[1]
stats = PercolationStats.new(n, t)
puts stats.mean
puts stats.stddev
puts [stats.confidence_lo, stats.confidence_hi]
