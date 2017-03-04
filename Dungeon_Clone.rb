#Dungeon_Clone.rb

#initialize inventory array
@inventory = []

def prompt
	print "Enter command > "
end

#help list when user enters help
def help
	puts "Things a baby adventurer needs to know : "
	puts "(g)o (direction): (n,w,e,s) move that direction"
	puts "(o)pen: open doors, chests, your eyes, etc"
	puts "(l)ook: examine the room your in"
	puts "(t)ake: add an item to your inventory"
	puts "(u)se: use an item in your inventory"
	puts "(i)nventory: see what items you have"
	puts "(q)uit: quit the game, as a coward would."
end

#exits the game
def quit
	Process.exit
end

#shows inventory when i or inventory is entered at command prompt
def inventory
	puts "you have the following items: "
	puts @inventory
end

#define rooms in the Dungeon_Clone
def chest_room
	if @key_present
		puts "You are in a small, round room."
		puts "An empty chest rests on the floor in front of you."
		puts "what do you do?"

	elsif !@key_present
		puts "You are in a small, round room."
		puts "On the floor in front of you is a small wooden chest."
		puts "It doesn't look locked"
		puts "what do you do?"
		@chest_open = false
		@key_present = false
	end
	while true
		prompt; next_move = gets.chomp

		if next_move.downcase == "h" || next_move.downcase == "help"
			help; prompt; next_move = gets.chomp
		end
		if next_move.downcase == "i" || next_move.downcase == "inventory"
			inventory; prompt; next_move = gets.chomp
		end
		if next_move.downcase == "q" || next_move.downcase == "quit" 
			quit
		end

		if next_move.downcase == "l" || next_move.downcase == "look"
			puts "This room is small..."
			puts "You see a small chest in the center of the room."
			puts "There is an exit to the southeast."
		elsif !@chest_open and !@key_present and (next_move.downcase == "o chest" || next_move == "open chest")
			puts "inside the chest, you see a small, brass key."
			@chest_open = true
		elsif @chest_open and !@key_present and (next_move.downcase == "take key" ||next_move.downcase == "t key" )
			puts "you grab the key"
			@key_present = true
			@inventory << "key"
		elsif next_move.downcase == "go southeast" || next_move.downcase == "g se"
			torch_room
		else puts "Does not compute..."
		end
	end

end

def dais_room
puts "This room is uncomfortably hot."
puts "There is an ornate stone dais in front of you."
puts "You can make out the faint outline of a door on the wall next to the dais."
puts "What do you do?"
@secret_door_open = false
while true
prompt; next_move = gets.chomp
if next_move == "help"
help; prompt; next_move = gets.chomp
end
if next_move == "inventory"
inventory; prompt; next_move = gets.chomp
end
if next_move == "quit"
quit;
end
if !@secret_door_open and next_move == "look"
puts "A large stone dais dominates this uncomfortably warm room."
puts "The dais is covered in a thick coating of dust."
puts "A faint outline of a door can be seen on the north wall next to the dais."
puts "There is an exit to the south."
elsif @secret_door_open and next_move == "look"
puts "A large stone dais dominates this uncomfortably warm room."
puts "The dais is covered in a thick coating of dust."
puts "A secret door has been revealed on the north wall next to the dais."
puts "There are exits to the north and south."
elsif !@orb_present and next_move.include? "dais"
puts "You search the dais, finding a small indentation in the center,"
puts "but can't think of anything you can do with it at the moment."
elsif next_move.include? "outline"
puts "You can definitely see the outline of a door leading out of this room,"
puts "but you find no way to open the door."
elsif @orb_present and next_move == "use orb on dais"
puts "You gently place the small, silver orb on the dais."
puts "The orb rolls around, then settles into a small indentation in the center of the dais."
puts "With a rumbling sound, a secret door is revealed to the right of the dais!"
@secret_door_open = true
@inventory.delete("Silver Orb")
elsif next_move == "go north" and @secret_door_open
 vine_room()
Process.exit(0)
elsif next_move == "go south"
torch_room()
else puts "I don't understand you."
end
end
end
				
				
def orb_room
puts "This room is unusually chilly."
puts "The room is small, square and covered in dust."
puts "You see an ornate stand in a corner."
@orb_present = false
@stand_moved = false
@seeds_present = false
 
while true
prompt; next_move = gets.chomp
if next_move == "help"
help; prompt; next_move = gets.chomp
end
if next_move == "inventory"
inventory; prompt; next_move = gets.chomp
end
if next_move == "quit"
quit;
end
if !@orb_present and !@stand_moved and next_move == "look"
puts "The ornate stand holds a small, silver orb."
puts "Most of this room is covered in dust."
puts "However, when you look more closely, you see something odd."
puts "The dust around the bottom of the orb stand has been disturbed,"
puts "as if it's been moved recently."
puts "There is an exit to the southwest."
elsif !@orb_present and !@stand_moved and next_move == "look"
puts "The ornate stand that held the orb is in a corner."
 puts "Most of this room is covered in dust."
puts "However, when you look more closely, you see something odd."
puts "The dust around the bottom of the orb stand has been disturbed,"
puts "as if it's been moved recently."
puts "There is an exit to the southwest."
elsif @orb_present and @stand_moved and next_move == "look"
puts "You've moved the stand away from the wall."
puts "Most of this room is covered in dust."
puts "There is an exit to the southwest."
elsif !@orb_present and @stand_moved and next_move == "look"
puts "The ornate stand holds a small, silver orb."
puts "You've moved the stand away from the wall."
puts "Most of this room is covered in dust."
puts "There is an exit to the southwest."
elsif !@orb_present and next_move == "take orb"
puts "You take the orb from its stand."
puts "The orb is almost painfully cold."
puts "You wrap the orb with a cloth and slip it into a pocket."
@orb_present = true
@inventory << "Silver Orb"
elsif !@stand_moved and next_move.include? "move" and next_move.include? "stand"
puts "With some effort, you move the stand aside."
puts "Hidden in a hole beneath the stand, you see a small box."
@stand_moved = true
elsif @stand_moved and !@seeds_present and next_move == "take box"
puts "You reach and grab the small box."
puts "Inside the small box, you find a handful of seeds."
puts "You tuck them safely away in a pocket."
@seeds_present = true
@inventory << "Packet of Seeds"
 elsif next_move == "go southwest"
torch_room()
else puts "I don't understand you."
end
end
end
 
def start
puts "You wake up and find yourself in a wide, dank room with a dirt floor."
puts "You aren't sure where you are or how you got here."
puts "The last thing you remember, you were walking home at night,"
puts "and felt a sharp blow to the back of your head."
torch_room()
end

def torch_room
puts "This room is dimly lit by two sputtering torches."
puts "There are three doors leading out of here."
puts "What do you do?"
@door_unlocked = false
while true
prompt; next_move = gets.chomp
if next_move == "god_mode"
god_mode; prompt; next_move = gets.chomp
end
if next_move == "help"
help; prompt; next_move = gets.chomp
end
if next_move == "inventory"
inventory; prompt; next_move = gets.chomp
end
if next_move == "quit"
quit;
end
if next_move == "look"
puts "This is the room you woke up in."
puts "It's a long, rectangular room."
puts "There are exits to the northeast, north and northwest."
puts "Above your head, you can see what appears to be the outline of a trapdoor."
puts "However, the ceiling is too tall for you to reach the trapdoor."
elsif next_move == "go northwest"
chest_room()
elsif next_move == "go north"
dais_room()
elsif @key_present and next_move == "use key on door"
puts "The key you found fits easily into the lock."
puts "With a click, you unlock the door!"
@door_unlocked = true
elsif !@door_unlocked and next_move == "go northeast"
puts "This door is securely locked."
puts "You'll need to find some way of opening it before you can enter."
elsif @door_unlocked and next_move == "go northeast"
orb_room()
else
puts "I don't understand you."
end
end
end

def vine_room
puts "You find yourself in a long, narrow corridor."
puts "You see exits to the north and east."
puts "There is a large pool of water to the west."
puts "You can make out what appears to be an opening in the ceiling,"
puts "high above the pool of water."
@vine_present = false
while true
prompt; next_move = gets.chomp
if next_move == "help"
help; prompt; next_move = gets.chomp
end
if next_move == "inventory"
inventory; prompt; next_move = gets.chomp
end
if next_move == "quit"
quit;
end
if next_move == "look"
puts "The water in the pool is too murky to make out any details."
puts "You can see bubbles rising from bottom of the pool."
puts "There are exits to the south, north and east."
puts "There is an opening in the ceiling above the pool of water."
elsif next_move == "go north"
holes_room()
elsif next_move == "go east"
stair_room()
elsif next_move == "go south"
dais_room()
elsif @seeds_present and next_move == "use seeds on pool"
puts "You toss the packet of seeds in the pool of water."
puts "For a moment, nothing happens, and then you feel a rumble in the ground,"
puts "deep beneath your feet."
puts "Enormous vines come bursting out of the pool of water, "
puts "reaching up through the opening in the ceiling."
@vine_present = true
@inventory.delete("Packet of Seeds")
elsif !@vine_present and next_move == "go up"
puts "You begin climbing the wall above the pool."
puts "After a few feet, you feel something tugging at your leg."
puts "To your horror, you realize some tentacled beast has grabbed you!"
puts "The monster pulls you into the water, where you are summarily devoured."
 dead()
elsif @vine_present and next_move == "go up"
face_room()
else puts "I don't understand you."
end
end
end
 
def stair_room
puts "You see a flight of stairs spiralling downward to the southeast."
@switch_pressed = false
while true
prompt; next_move = gets.chomp
if next_move == "help"
help; prompt; next_move = gets.chomp
end
if next_move == "inventory"
inventory; prompt; next_move = gets.chomp
end
if next_move == "quit"
quit;
end
if next_move == "look"
puts "This room is dominated by a flight of stairs that curves downward."
puts "Looking more closely, you see a small switch at the top of the stairs."
puts "There is an exit to the west."
elsif next_move == "press switch"
puts "You reach out and press the small switch."
puts "You hear a distant clanking of metal, as if something has slid into position."
@switch_pressed = true
elsif !@switch_pressed and next_move == "go down"
puts "As you step on the third step, you feel a slight rumble beneath your feet."
puts "The stairs collapse into a smooth chute."
puts "You can find nothing to hold on to and helplessly slide to the bottom."
puts "At the bottom, you fall into an open waiting pit."
puts "It takes a long time to hit the bottom."
dead()
elsif @switch_pressed and next_move == "go down"
alcove_room()
elsif next_move == "go west"
	 vine_room()
else puts "I don't understand you."
end
end
end

def alcove_room
puts "You follow the stairs down."
puts "You see a large pit in front of you."
puts "There is a small alcove in the wall next to you."
@red_jewel_present = false
while true
prompt; next_move = gets.chomp
 
if next_move == "help"
help; prompt; next_move = gets.chomp
end
if next_move == "inventory"
inventory; prompt; next_move = gets.chomp
end
if next_move == "quit"
quit;
end
if next_move == "look"
puts "You find yourself at the bottom of the stairs."
puts "There is a dark pit to the west and a small alcove to the south."
puts "It's impossible to tell how deep the pit is."
puts "You see a brilliant red jewel in the alcove."
elsif next_move == "take jewel"
puts "You grab the red jewel and store it safely away in a pocket."
@red_jewel_present = true
@inventory << "Red Jewel"
elsif next_move == "go up"
stair_room()
else puts "I don't understand you."
end
end
end

def holes_room
puts "You find yourself in a square room with a stone ledge against the far wall."
puts "There are three round holes above the stone ledge."
puts "The holes are too dark to see inside, but you think you could reach inside."
@blue_jewel_present = false
while true
prompt; next_move = gets.chomp
if next_move == "help"
help; prompt; next_move = gets.chomp
end
if next_move == "inventory"
inventory; prompt; next_move = gets.chomp
end
if next_move == "quit"
quit;
end
if next_move == "look"
puts "You see three holes, lined up in a row."
puts "The holes are too dark to see very far into."
puts "There is nothing unusual about the left hole or the ledge in front of it."
puts "There are several deep gouges on the stone ledge in front of the center hole."
puts "You can feel a slight breeze coming from the right hole. The breeze smells faintly metallic."
puts "There is an exit to the south."
elsif !@blue_jewel_present and next_move.include? "left hole"
puts "You carefully reach into the left-most hold and find something round and hard."
puts "When you pull it out, you find yourself holding a brilliant blue gem."
@blue_jewel_present = true
@inventory << "Blue Jewel"
elsif next_move.include? "center hole"
puts "You carefully reach into the center hole and feel around."
puts "Suddenly, you feel a sharp pain, as if something has bitten your hand."
puts "The last thing you see before you black out is a swarm of spiders crawling down your arm."
dead()
elsif next_move.include? "right hole"
puts "You carefully reach into the right hole and feel around."
puts "Suddenly, you feel something shift above your hand."
puts "A crushing weight pins your arm, trapping you."
puts "Luckily, it only takes a couple of weeks to die of thirst."
dead()
elsif next_move == "go south"
vine_room()
else puts "I don't understand you."
end
 end
end

def face_room
puts "This room is dominated by a large, stone face set into the northern wall."
puts "The face has empty sockets where its eyes should be."
puts "You can see dried blood around the mouth of the giant stone face."
puts "In the corner of the room, you see the skeletal remains of a humanoid."
@sword_present = false
@red_jewel_placed = false
@blue_jewel_placed = false
while true
prompt; next_move = gets.chomp
if next_move == "help"
help; prompt; next_move = gets.chomp
end
if next_move == "inventory"
inventory; prompt; next_move = gets.chomp
end
if next_move == "quit"
quit;
end
if next_move == "look"
puts "The eye sockets of the giant face look as if something is meant to be placed in them."
puts "The skeleton appears to be a fallen adventurer, but you only see the bones of his torso."
puts "You also see what's left of his gear, including a sword that seems to be in good shape."
puts "There is an exit leading down."
elsif next_move == "take sword"
puts "You pick up the sword, placing it inside its scabbard and strap it to your belt."
puts "You feel like a real adventurer now!"
@sword_present = true
@inventory << "Sword"
elsif !@blue_jewel_placed and next_move == "use red jewel on face"
puts "You find the red jewel fits smoothly into the right eye socket of the stone face."
puts "With a groan, the mouth of the face opens up, revealing a dark passage to the north."
@red_jewel_placed = true
elsif @blue_jewel_placed and next_move == "use red jewel on face"
puts "When you place the red jewel into the right socket, you hear a sound,"
puts "almost a small groan of approval, coming from the gigantic stone face."
@jewels_placed = true
@inventory.delete("Red Jewel")
 elsif !@red_jewel_placed and next_move == "use blue jewel on face"
puts "You find the blue jewel fits smoothly into the left eye socket of the stone face."
puts "With a groan, the mouth of the face opens up, revealing a dark passage to the north."
@blue_jewel_placed = true
elsif @red_jewel_placed and next_move == "use blue jewel on face"
puts "When you place the blue jewel into the left socket, you hear a sound,"
puts "almost a small groan of approval, coming from the gigantic stone face."
@jewels_placed = true
@inventory.delete("Blue Jewel")
elsif !@jewels_placed and next_move == "go north"
puts "You begin crawling into the small passage, but are interrupted by an unearthly shriek."
puts "The mouth of the stone face closes with a crash, severing your body in twain."
dead()
elsif @jewels_placed and next_move == "go north"
spider_room()
elsif next_move == "go down"
vine_room()
end
end
end

def spider_room
puts "This room is dominated by a giant web that stretches from floor to ceiling."
puts "In the center of the web is a monstrous spider."
puts "The spider eyes you with malicious intent."
@spider_dead = false
while true
prompt; next_move = gets.chomp
if next_move == "help"
help; prompt; next_move = gets.chomp
end
if next_move == "inventory"
inventory; prompt; next_move = gets.chomp
end
if next_move == "quit"
quit;
end
if !@spider_dead and next_move == "look"
puts "There is a huge spider sitting in the web in the middle of this room."
puts "It appears to be ready to attack."
puts "You can see an exit to the north, behind the creature's web."
elsif @spider_dead and next_move == "look"
puts "The bloated corpse of a spider lies curled in a corner of this room."
puts "There are exits to the north and south."
elsif @sword_present and next_move == "use sword on spider" or next_move == "attack spider"
puts "You charge toward the bloated monstrosity, raising your sword as you go."
puts "The sword begins to glow with an eerie light, and you sink the blade deep into the spider's stomach."
puts "The foul creature lets out a hideous shriek before curling up and dying."
@spider_dead = true
elsif !@sword_present and next_move == "use sword on spider" or next_move == "attack spider"
puts "You charge toward the bloated monstrosity, raising your fist in defiance."
puts "The spider seems almost to chuckle as it easily dodges your attack,"
puts "then sinks its fangs into your neck."
dead()
elsif !@spider_dead and next_move == "go north"
puts "You attempt to sneak past the spider, hoping it won't notice your passage."
puts "Unfortunately for you, it does, and you quickly find yourself paralyzed,"
puts "wrapped in silk and ready to be eaten."
dead()
elsif @spider_dead and next_move == "go north"
puts "The passage behind the spider's web is a long, dark tunnel."
puts "After traveling for some time, you see a faint light in the darkness."
puts "It appears you've found your way out of the dungeon!"
puts "Congratulations!"
Process.exit

 elsif next_move == "go south"
face_room()
end
end
end
 
# this method is called if a player dies in the dungeon and allows him to continue from the beginning or quit
def dead
puts "You have died. Perhaps that wasn't the wisest course of action?"
puts "Would you like to try again?"
while true
prompt; next_move = gets.chomp
if next_move == "yes"
start()
elsif next_move == "no"
Process.exit
else puts "I don't understand you."
end
end
end
 
start()