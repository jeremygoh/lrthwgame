#prompt
def prompt
	print "> "
end

#bear_room
$bear_moved=false

def bear_room
	puts "It's a dead end and to top it off, there's a bear in the room!\nHe moves swiftly for a big guy and blocks off your exit\n\nDo you run or fight?"
	prompt
	run_or_fight=gets.chomp
	if run_or_fight.include?("run")
		death("You're a coward....\n\n\n\nAlso, you weren't fast enough and the bear ate you.")
	elsif run_or_fight.include?("fight") && !$bear_moved
		$bear_moved=true
		puts "You fought with the bear and landed a punch which dazed it. You scramble for the exit.\n\n"
		start
	elsif run_or_fight.include?("fight") && $bear_moved
		death("The bear's been training since your last encounter and feints, dodges and eats you.")
	else
		death("Fight or flight means nothing to you. The bear mauls you and you die.")
	end
end

#dark_room
def dark_room
	puts "You enter an even darker area. You think it's a room but you're not sure.\nDo you reach for a switch (y/n)?"
	prompt
	switch = gets.chomp
	if switch.downcase == 'y'
		puts "You find a switch and it works!\nIn front of you is a spaceship which you get into and you're out of there.\n\nYou win!"
		Process.exit(0)
	elsif switch.downcase == 'n'
		puts "You decide not to reach for a switch and instead retrace your steps back into the hallway\n"
		start
	else
		death('You stay in darkness for all eternity and die.')
	end
end

#death
def death(x)
	puts "\n"
	print "#{x} Good job \n\n"
	Process.exit(0)
end

#start
def start
	puts "...You are in a dark hallway with two doors leading off it.\nWhich door do you choose? (1 or 2)"
	prompt
	case gets.chomp
	when "1" then bear_room
	when "2" then dark_room
	else 
		death("Your indecision (or inability to type) leads to your death.")
	end	
end


start