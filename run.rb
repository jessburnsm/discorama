# Load all game files
Dir["lib/**.*", "lib/*/**.*"].each { |file| require_relative file }

# Initializes and runs 'Drama at the Discorama'
class Game
  def initialize
    @world = World.new
    @player = Player.new
    @input_parser = InputParser.new
    @game_text = GameText.new
    start_game
  end

  private

  # Begin the game and start the game loop
  def start_game
    begin
      @game_text.intro

      while @player.alive?
        if @player.in_battle?
          BattleDirector.new(@player).execute_opponent_turn
          @game_text.battle_prompt
          BattleDirector.new(@player).call(@input_parser.parse)
        else
          @game_text.delimiter
          @current_room = @world.get_room_of(@player)
          @game_text.current_status(@current_room)
          @game_text.action_prompt
          ActionDirector.new(@world, @player).call(@input_parser.parse)
        end
      end
    rescue SystemExit, Interrupt # Catpure ctrl+c exit, end gracefully
      @game_text.exit
    end
  end
end

Game.new
