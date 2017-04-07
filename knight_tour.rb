class KnightTour

  def intialize(matrix)
    @N = matrix[0].size # assumes square matrix
    @start_point = 0
  end

  def solve
    return traverse(Knight.new(@N, @start_point))
  end

  def traverse(knight)
    unless knight.traversed?
      next_positions = knight.find_next_positions
      next_positions.each do |next_position|
        knight = traverse(knight.dup.traverse_to(next_position))
        unless knight.nil?
          return knight # return the first solution found
        end
      end
    end
  end
end

class Knight
  LEGAL_MOVES = [
    [-2,  1], [-1,  2], [ 1,  2], [ 2,  1],
    [ 2, -1], [ 1, -2], [-1, -2], [-2, -1]
  ]

  def initialize(board_size, start_at)
    @board = Array.new(board_size[0]) { Array.new(board_size[1], 0)}
    @steps_taken = 0
    traverse_to(start_at)
  end

  def initialize_copy(other)
    @board = Marshal.load(Marshal.dump(other.board))
    @steps_taken = other.steps_taken
  end

  def traversed?
    last_step = @board.size * @board[0].size
    @steps_taken == last_step
  end

  def traverse_to(new_position)
    @steps_taken += 1
    @current_position = new_position
    @board[@current_position[0]][@current_position[1]] = @steps_taken
    self
  end

  def find_next_positions
    positions = LEGAL_STEPS.map do |step|
      position_after_step(position, step)
    end
    positions.reject { |pos| pos.nil? || visited?(pos[0]][pos[1]])}
  end

  def position_after_step(from, step)
    x_pos = from[0] + step[0]
    y_pos = from[1] + step[1]

    if is_safe?(x_pos, y_pos)
      [x_pos, y_pos]
    else
      nil
    end
  end

  def visited?(x, y)
    @board[x][y] > 0
  end

  def is_safe?(x, y)
    return (x >= 0 && x < @board.size && y >= 0 && y < @board[0].size)
  end
end
