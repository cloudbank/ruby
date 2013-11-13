require_relative 'room'
require_relative 'corridor'
require_relative 'laser_weapon_armory'
require_relative 'bridge'
require_relative 'escape_pod'



class Game

  def initialize(start)
    @quips = [
      "You died. ",
      "Nice job, you died ",
      "Such an unfortunate end.",
      "I have no regrets."
    ]
    @start = start
  end

  
#pass in method with class name


  def play()
    next_room = @start
	
    while true
      puts "\n--------"
	  if( next_room == :death)
		puts 'got here'
			self.death()
	  else	
      #room = method(next_room)
	  puts next_room
		room = Object.const_get(next_room).new
	   	next_room = room.go()
        #next_room = room.call()
    end
  end
end
  def death()
    puts @quips[rand(@quips.length())]
    Process.exit(1)
  end
 
 end 
a_game = Game.new(:Corridor)

a_game.play()