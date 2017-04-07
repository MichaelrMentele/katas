# The game of battleship involves two players
# Each player can make shots at points on the grid
# There is two grids: one for each player
# A player has access to the the location of their own boats
# and the shots fired against them and also the shots they
# have taken against the opponents grid and whether they have hit or not.

# GameManager -> Player -> BattleGrid -> Shots
#                       -> Ships

# Objects:
# GameManager
  # Has two players
  # GameOver? - Before passing priority to the opponent it checks if the playe
  # has sunk all the opponents ships
class GameManager

  def initialize(player, opponent)
    @player = player
    @opponent = opponent
  end

  def play
    # Player fires
      # Take shot on opponents grid
      # target = Player.fire
      # Opponent.update(target)
    # Query public grid state (hits/misses) of opponent
      # Player.battle_status.
    # Queries Opponents.ships_alive?, if false, victory
    # Update screen

    # Opponent fires
    # ...
  end
end

class BattleView
  def self.view(home_grid, away_grid))
    # screen formating stuff
  end
end

# Player
  # Has A Grid
  # #Shoot (ping a single point on opponents grid for if ship exists)
    # Returns a results object that says if there was a hit (true) or miss (false) and
    # if it was a hit it returns whether the ship was sunk
class Player
  def initialize(grid)
    @grid = grid
    @ships = [BattleShip.new, Destroyer.new, Cruiser.new]
  end

  def fire
    # Player enters input coordinate and it is returned
  end

  def fired_upon(x, y)
    # Check the grid; shot,grid.shot_result(x, y)
    #
  end

  def battle_status
    # returns the hit/miss of the players grid
  end

  def fleet_status
    # ships.each -> ship_name, ship.alive?
  end

  def lost?
    # ships.each -> ship.alive?
  end
end

# FiringGrid
  # Records the state of shots taken against the opponent
  # Has many shots
class BattleGrid
  def initialize(n)
    @grid = # create a nXn hash ie. { [x,y] => 'hit/miss' }
            # each shot is initialized to "nil"
  end

  def shot_result(x, y, ships)
    # access shot object at x,y
    # check against ships coordinates
    # update shot result
  end

  def status_report
    # returns @grid
  end
end

class Shot
  attr_reader :result

  def initialize
    @result = "miss"
  end

  def hit!
    @result = "hit"
  end
end

# Ship
  # is of size 1xN or Nx1
  # when N distinct points have been 'hit' it returns sunk
class Ship
  def initialize(ship_type, start_xy, finish_xy)
    # @name = ship_type
    # @spaces = generate(start_xy, finish_xy)
    # generate_coordinates
  end

  def alive?
    status
  end

  def location
    # returns list of [x,y] coordinates
  end
end
