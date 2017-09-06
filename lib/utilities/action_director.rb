# Responsible for executing actions on game objects
class ActionDirector
  def initialize(world, player)
    @world = world
    @player = player
    @current_room = @world.get_room_of(@player)
    @game_text = GameText.new
  end

  def call(action)
    begin
      Command.get_command(action[:command]).execute(action[:target], @current_room, @world, @player)
    rescue CommandNotFound => message
      @game_text.command_error(message)
    rescue TargetNotFound
      @game_text.target_error
    end
  end
end
