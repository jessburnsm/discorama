# Load all game files
Dir["lib/**.*", "lib/*/**.*"].each { |file| require_relative file }

# Initializes and runs 'Drama at the Discorama'
class Game
  def initialize
    @world = World.new
    @player = Player.new
    @input_parser = InputParser.new
    start_game
  end

  private

  # Begin the game and start the game loop
  def start_game
    begin
      Text::intro

      while @player.alive?
        @current_room = @world.get_room_of(@player)
        print_status
        Text::prompt
        take_action(InputParser::parse)
      end
    rescue SystemExit, Interrupt # Catpure ctrl+c exit, end gracefully
      puts ""
      Text::exit
      exit
    end
  end

  # Output player status and position in the world
  #
  # ==== Returns string that describes player's position in the world
  def print_status
    puts ""
    puts @current_room
    @current_room.content.each do |key, content|
      puts content
    end
    # puts "You are at map coordinates [#{@player.x_coord}, #{@player.y_coord}]"
  end
end

# class Command
#   def self.get_command(user_input)
#     case user_input
#     when :north
#       Command::Movement.new(:north)
#     end
#   end
# end

# class Command::Movement
#   MOVE_MAPPING = {
#     north: { y: -1, x: 0 },
#     south: { y: 1, x: 0 }
#   }

#   def initialize(direction)
#     @direction = direction
#   end

#   def execute(world, player)
#     direction_changes = MOVE_MAPPING[@direction]
#     next_room = world.get_room(player.current_room, direction_changes)
#     player.current_room = next_room
#   rescue InvalidMovement => e
#     GameText.invalid_move
#   end
# end

# class Command::Attack
#   def execute(world, player)
#   end
# end

# class Command::Talk
#   def execute(world, player)
#   end
# end

# class Command::Help
#   def execute(*)
#   end
# end

# command.execute(world, player)

Game.new
