# Load all game files
Dir["lib/**.*", "lib/*/**.*"].each { |file| require_relative file }

# Initializes and runs 'Drama at the Discorama'
class DiscoEngine
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

      # Run the tutorial
      ActionDirector.new(@world, @player).call({command: :talk, target: :jerry})

      # The main game
      while @player.alive? && @world.has_hostiles?
        @player.in_battle? ? battle_loop : game_loop
      end

      @player.alive? ? @player.win : @player.defeat
    rescue SystemExit, Interrupt # Catpure ctrl+c exit, end gracefully
      @game_text.exit
    end
  end

  def game_loop
    # @game_text.delimiter
    @game_text.current_status(@world.get_room_of(@player))
    @game_text.action_prompt
    ActionDirector.new(@world, @player).call(@input_parser.parse)
  end

  def battle_loop
    @game_text.battle_prompt
    BattleDirector.new(@player).call(@input_parser.parse)
    BattleDirector.new(@player).execute_opponent_turn
  end
end

DiscoEngine.new
