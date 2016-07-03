# Nouns:
# ManagementApp
# Employees
#   -desk
#   -name
#   -serial numbers
#   FulltimeEmployees
#     -vacaydays
#     Managers
#       desk = private office
#       vacaydays = 14
#     Executives
#       desk = corner office
#       vacaydays = 20
#     RegularEmployees
#       desk = cubicle farm
#       vacaydays = 10
#   Parttime Employees
#     desk = open workspace
# Prefixable
# Delegator

class EmployeeManager
  def initialize
    employees = {}
    id = 0
  end

  def add(employee)
    employees[id.to_s] = employee 
    id += 1
  end
end

class Employee
  def initialize(name, serial_number)
    @desk = 'open'
    @name = name
    @serial_number = serial_number
  end

  def say_name
    puts @name
  end
end

class PartTimeEmployee < Employee
end

class FulltimeEmployee < Employee
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 0
  end
end

class Manager < FulltimeEmployee
  include Delegator

  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 14
    @desk = private_office
  end

  def say_name
    puts "Mgr #{@name}"
  end
end

class Executive < FulltimeEmployee
  include Delegator

  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 20
    @desk = corner_office
  end

  def say_name
    puts "Exe #{@name}"
  end
end

class RegularEmployee < FulltimeEmployee
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 10
    @desk = cubicle_farm
  end
end

module Delagator
  def delegate
    puts "I delegated..."
  end
end

