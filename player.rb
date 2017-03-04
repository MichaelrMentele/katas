class Player

	def initialize
		@HEALTH_CAP = 20
		@health = 20
		@backwards_explored = false
		@what_lies_ahead = []
		@what_lies_behind = []
		@all_clear_behind = true
	end

	def play_turn(warrior)
		
		@what_lies_ahead = warrior.look
		@what_lies_behind = warrior.look(:backward)		

		if !@what_lies_behind.empty? && @all_clear_behind
			@all_clear_behind = false
			warrior.pivot!
			

		elsif warrior.look.empty?
			all_clear = true

		elsif @what_lies_behind.empty? 
			@what_lies_ahead.each do |space| #@what_lies_ahead.include?('C')
				if space.captive?
					break
				elsif space.enemy?
					warrior.shoot!
					return
				end
			end
		# elsif warrior.feel(:backward).captive? 
		# 	warrior.rescue!(:backward)
		elsif warrior.feel.captive?
			warrior.rescue!
		elsif warrior.feel.wall?
			warrior.pivot!
		elsif warrior.health < (@HEALTH_CAP/3) && @health > warrior.health #if hurt badly and taking damage retreat
			warrior.walk!(:backward)
		# elsif !@backwards_explored #if there is space behind you explore till you hit a wall
		# 	warrior.walk!(:backward)
		# 	if warrior.feel(:backward).wall?
		# 		@backwards_explored = true
		# 	end
		elsif warrior.feel.empty? #if its empty in front and you've explored behind...
			if @health > warrior.health  #if your being hurt attack!
				warrior.walk!
			elsif @health < 19 
				warrior.rest!
			else
				warrior.walk!
			end
		else
			warrior.attack!
		end

		@health = warrior.health
	end
end
