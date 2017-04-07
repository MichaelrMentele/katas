# Designing an Elevator
# An OO design exercise

# Description:
# An elevator is a box that holds objects and goes up and down inside a building,
# carrying those objects to different levels or floors vertically. An elevator
# has two interfaces: an external interface that 'calls' the elevator to a 
# given floor, and an internal interface that allows the user to give commands
# like emergency, open, and close the doors. It has an emergency button that sends
# a message to emergency services.

#################### Initial Discovery... #################
# Objects:
# Floors
# Elevator
# Call Interface
# Internal Elevator Interface

# The state that needs to be managed is the location of the elevator; what floor is
# it at? What floor has been requested? Has an external request been requested? What
# floor has it been called from? What is the order that we should answer the requests?
# - location of the elevator
# - floor of a request
# - the sequence of reqeusts

# We want to use the location of the elevator and a queue of requests to make the 
# determination about the sequence of stops the elevator needs to make. 

# Objects and State:
# StopQueue -> Holds requested floors
# Control System -> directs the elevators current location (stops) based on the 
#                   queued calls from floors.
# CallButton -> Holds the floor to travel to, and the elevator it is attached to

# An elevator has many call buttons and a building has a call button on each floor
# for a given elevator. For a building of n floors, we have n building call buttons
# one on each floor, and we have n call buttons in the elevator, one for each floor

# We have a floor and it has a call button
# We have an elevator and it has n call buttons, for each floor
# A system uses the queue of calls to certain floors and the current state of the elevator 
# to direct the elevator to that floor.

########################### Top Level ####################
# We have a building with an elevator system -> nav system & call system
class Building
  def initialize(bottom:0, top:100, elevator_system: ElevatorSystem)
    # could potentially hold the number of floors if we were worried about being hacked
    # in this case we will assume a call can never be put into the system that is outside
    # of the size of the building, so the bounds are implicit in the system.
    # ...

    @elevator_system.new(bottom: bottom, top: top)
  end       
end

class ElevatorSystem
  def initialize(bottom: bottom, top: top, elevator: Elevator.new, navigation: Navigation)
     # The elevator holds a command console, calls are considered part of the navigation system (call_system/router)
    @elevator = elevator
    @navigation = navigation.new(bottom: bottom, top: top)
  end
  
  def operate
    # while @elevator.safe? do    
      # @elevator.travel_to(router.next)
      # router.route
    # send_sos
  end
  
  def send_sos
    # sends a message to emergency services to come save our asses
  end
end

################ NAV ###############
class Navigation
  def initialize(bottom:, top:, call_system: CallSystem, router: RouteManager, buffer: CallBuffer.new)
    @buffer = buffer
    @call_system = call_system.new(@buffer)
    @router = router.new(@buffer)
  end
end

class RouteManager
  def intialize(sequence=Queue.new, buffer=Buffer.new)
    @sequence = sequence
    @buffer = buffer
  end

  def route
    add_stops(@buffer.release_jobs)
  end

  def add_stops(floors)
    # A call is placed from anywhere, inside or outside the elevator. However it comes in
    # it is treated the same. We add it to the system queue. 

    # @sequence.add(floors)
  end

end

# The call system is for writing calls to the buffer, and this is getting input from the 
# building floors
class CallSystem
  def initialize(call_buffer:, floors:)
    @buffer = call_buffer
    @floors = floors
  end

  def call
    # writes a call to the buffer, based on the floor the call is made on...
  end
end



#################### ASYNC READ/WRITE WITH BUFERS ################
class Buffer
  def initialize(filepath)
    @filepath = filepath
  end
end

class CommandBuffer < Buffer
  def read
    # parses the command file
  end
end

class CallBuffer < Buffer
  def read
    # parses the file for a list of floors to stop at.
  end
end
class Elevator
  def initialize(command_buffer=CommandBuffer.new
    @vertical_position = 0
    @safe = true
  end

  def travel_to(n)
    @vertical_position = n
  end

  def emergency!
    @safe = false
  end

  def safe?
    @safe
  end
end
