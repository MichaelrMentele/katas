# #basics.rb
# class Character
# 	def initialize()
		
# 	end
# end

class Player #<< Character

	attr_accessor :location, :items

	def initialize
		@location = { description: "You are in the living-room. A wizard is snoring loudly on the couch.",
             items: ["whiskey", "bucket"] }
        @items = []
	end

	def look
		puts location[:description]
		puts location[:items]
	end

	def pick_up(item)
		if location[:items].include?(item)
			index = location[:items].find_index(item)
			@items = location[:items][index]
			location[:items].delete_at(index)
			puts "You pick up the #{item}"
		else
			puts "#{item} does not exist."

		end
	end
end

class Map
	def initialize
		@locations = [{ name: "living_room",
		               description: "You are in the living-room. A wizard is snoring loudly on the couch.",
		               items: ["whiskey", "bucket"],
		               edges: [{ direction: "upstairs",
		                         item: "ladder",
		                         location: "attic" }] }, {
		               name: "attic",
		               description: "You are in the attic. There is a giant welding torch in the corner.",
		               edges: [{ direction: "downstairs",
		                        item: "ladder",
		                        location: "living_room" }] }]
		@current_location = @locations[0]
	end

	def describe
		puts @current_location[:description]
	end

	def move_to(direction)
		@locations.each do |location|
			location[:edges].each do |edge|
				$location_name = edge[:location] if edge[:direction] == direction
				
				
			end
		end
		
		@current_location = locations[$location_name]
	end

end



# mike = Player.new
# mike.look
# mike.pick_up("whiskey")
# mike.look

# puts 'eji'

map = Map.new
map.describe
map.move_to("upstairs")
map.describe
# map.describe
