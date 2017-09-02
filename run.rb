Dir["lib/**.*", "lib/*/**.*"].each { |file| require_relative file }

class Game
  def initialize
    @world = World.new
    @player = Player.new
    start_game
  end

  private

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

  def parse_player_input
    articles = ['a ', 'an ', 'the ', 'to ', 'go ', 'at ']
    regex = Regexp.union(articles)

    Text::prompt
    parsed = gets.chomp.downcase.gsub(regex, '').split

    { command: (parsed[0].to_sym unless parsed[0].nil?), target: ( parsed[1].to_sym unless parsed[1].nil? ) }
  end

  def print_status
    puts ""
    puts @current_room
    @current_room.content.each do |key, content|
      puts content
    end
    # puts "You are at map coordinates [#{@player.x_coord}, #{@player.y_coord}]"
  end

  def execute_interactive_action(command, target)
    if target && @current_room.content.key?(target)
      @current_room.content[target].send(command)
    else
      Text::error
    end
  end

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
