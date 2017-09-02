# Load all game files
Dir["lib/**.*", "lib/*/**.*"].each { |file| require_relative file }

# Initializes and runs 'Drama at the Discorama'
class Game
  def initialize
    @world = World.new
    @player = Player.new
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
        take_action(parse_player_input)
      end
    rescue SystemExit, Interrupt # Catpure ctrl+c exit, end gracefully
      puts ""
      Text::exit
      exit
    end
  end

  # Attempt to interpret player's input as a command -> object concept
  def parse_player_input
    articles = ['a ', 'an ', 'the ', 'to ', 'go ', 'at ']
    regex = Regexp.union(articles)

    Text::prompt
    parsed = gets.chomp.downcase.gsub(regex, '').split

    { command: (parsed[0].to_sym unless parsed[0].nil?), target: ( parsed[1].to_sym unless parsed[1].nil? ) }
  end

  # Output player status
  def print_status
    puts ""
    puts @current_room
    @current_room.content.each do |key, content|
      puts content
    end
    # puts "You are at map coordinates [#{@player.x_coord}, #{@player.y_coord}]"
  end

  # Sends command to game object, if applicable
  #
  # ==== Attributes
  #
  # * +command+ - the action/method that will be sent to the object
  # * +target+ - the game object that will receive the action
  def execute_interactive_action(command, target)
    if target && @current_room.content.key?(target)
      @current_room.content[target].send(command)
    else
      Text::warning
    end
  end

  # Determine what action to take in the game, based on player input
  #
  # ==== Attributes
  #
  # * +action+ - hash in the format: {commmand, target}, where command is the action
  # the user intends to take, and target is the game object upon which the command will
  # be executed.
  def take_action(action)
    case action[:command]
    when :look, :talk, :take
      execute_interactive_action(action[:command], action[:target])
    when :north
      @world.move_entity_north(@player)
    when :east
      @world.move_entity_east(@player)
    when :south
      @world.move_entity_south(@player)
    when :west
      @world.move_entity_west(@player)
    # when :fight, :take
    #   @current_room.interact(@player)
    # when :status
    #   @player.print_status
    when :help
      Text::help
    when :exit
      Text::exit
      exit
    when nil
    else
      Text::error
    end
  end
end

Game.new
