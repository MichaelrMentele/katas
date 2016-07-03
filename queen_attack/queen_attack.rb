class Queens
  WHITE_SYMBOL = 'W'
  BLACK_SYMBOL = 'B'

  attr_accessor :board

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError, "Queens cannot have the same position." if white == black 
    @board = []
    initialize_board!
    @board[white[0]][white[1]] = WHITE_SYMBOL
    @board[black[0]][black[1]] = BLACK_SYMBOL
  end

  def initialize_board!
    8.times do
      row = []
      8.times do
        row.push('_')
      end
      @board.push(row)
    end
  end

  def white
    @board.each_with_index do |row, i_row|
      row.each_with_index do |ele, i_col|
        if ele == WHITE_SYMBOL
          return [i_row, i_col]
        end
      end
    end
  end

  def black
    @board.each_with_index do |row, i_row|
      row.each_with_index do |ele, i_col|
        if ele == BLACK_SYMBOL
          return [i_row, i_col]
        end
      end
    end
  end

  def attack?
    same_row? || same_col? || diagonal?
  end

  def same_row?
    white[0] == black[0]
  end

  def same_col?
    white[1] == black[1]
  end

  def diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end

  def to_s
    new_board = ''
    @board.each do |row|
      new_board += row.join(' ') + "\n"
    end
    new_board.chomp
  end
end

test = Queens.new
queens = Queens.new(white: [4, 3], black: [3, 4])
require 'pry'; binding.pry;