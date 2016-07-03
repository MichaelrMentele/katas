class Triangle

  attr_accessor :rows, :triangle
  attr_reader :num_rows

  def initialize(num_rows)
    @num_rows = num_rows
    @triangle = []
    initialize_triangle
  end

  def make_empty_triangle
    for num in (1..self.num_rows)
      self.triangle.push(make_nil_row(num))
    end
  end

  def make_nil_row(length)
    row = []
    length.times {row.push(nil)}
    row
  end

  def initialize_triangle
    if self.num_rows >= 1
      make_empty_triangle
    else
      return []
    end
  end

  def pascalize!
    self.triangle[0..-1].each_with_index do |row, r_i|
      prev_row = self.triangle[r_i - 1]
      row.each_with_index do |num, n_i|
        if first_row?(r_i)
          @triangle[0][0] = 1
        elsif beg_of_row?(n_i)
          self.triangle[r_i][n_i] = prev_row[n_i]
        elsif end_of_row?(row.length, n_i)
          self.triangle[r_i][n_i] = prev_row[n_i - 1]
        else
          self.triangle[r_i][n_i] = prev_row[n_i - 1] + prev_row[n_i]
        end
      end
    end
  end

  def first_row?(row_index)
    row_index == 0
  end

  def beg_of_row?(index)
    index == 0
  end

  def end_of_row?(length, index)
    index == length - 1
  end

  def rows
    pascalize!
  end
end
