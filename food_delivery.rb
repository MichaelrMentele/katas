#Design OO food delivery app catering to use cases

# 1) User can search different restaurant
# 2) User can select a restaurant
# 3) User sees a menu
#4) Restaurant can change the menu any time
#5) User adds an item from menu
#6) User orders the food
#7) User can track the order in real time
#8) User can cancel the order
#9) User pays for the order

# restaurant - > menu -> item
# user -> order -> (s) items
#               -> (s) location
#               -> (c) cancel

billy = User.new("billy", address)
restaurants = [Restaurant.new("Olive Garden", menu), Restaurant.new("McDonald", menu)

top_matches = billy.search(restaurants, {"search criteria"})
restaurant = billy.select(restaurants)

items = User.select(restaurant.menu)
order = restaurant.order(items, user)

order.track # being cooked

restaurant.cook # handles the order creation, when it is done it is delivered
restaurant.deliver! # restaurant has an order with an id, with a status of out for delivery

order.update_location # en route @ some location
order.track # en router @ some location

order.location == billy.location

user.pay(restaurant)

# We want the user to contain: his location, we also want the restaurant to have location and infromation about itself
# We should also have an order object that contains a refernce to the two parties in the transaction and an updating location
# The order object is sent from the restaurant to the user

# Objects and functions

class User
  # has many orders
  def initialize(name, address, money)
     @orders
  end

  def search(searchable=Restaurant, criteria)
    # returns top 10 restaurant matches, maybe creating custom SQL queries against the resource
  end 

  def select_restaurant(restaurants)
    # chooses a restaurant 
    # returns a restaurant
  end

  def view(menu)
    # print out a menu
  end
 
  def place_order(restaurant, items)
    # places an order at the restaurant
    # associates the order with the user
  end

  def track
    # query users orders, then
    # look up status and lcoation of current open orders
  end
 
  def orders
    # returns users orders
  end

  def pay(order)
    # checks if order exists and is users, if it is, then it pays it
    orders
    order.pay
  end
end


class Restaurant
  # A restaurant has many orders
  # A restaurant has a menu with many items
  def initialize(name, address, menu)
    menu
  end

  def take_order(items)
    # add to order queue
  end

  def update_menu(menu_id, changes={})

  end

  def update_status(order)
    # when order is complete POST that it is being sent
  end
end

class Menu
  def initialize
    @items = { name: {price:, desc:}
  end

  def add_item(item)
    # add item
  end

  def remove_item(item)
    # remove item
  end
end

class Order
  def initialize(items, status, location)
    @items = Item.find..
    @status = ""
    @location = [lat, long]
  end

  def track
    # returns current location coordinates
  end

  def pay
    # pays the order and updates its status as complete
  end

  def update(status, location)
    # saves a new status and lcoation
  end
end
