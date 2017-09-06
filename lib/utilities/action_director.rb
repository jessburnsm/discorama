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
      Command.get_command(action[:command]).execute(action[:target], @current_room)
    rescue CommandNotFound => message
      @game_text.command_error(message)
    rescue TargetNotFound
      @game_text.target_error
    end

    # puts ""
    # case action[:command]
    # when :look, :talk, :take
    #   execute(action[:command], action[:target])
    # when :north
    #   @world.move_entity_north(@player)
    #   #@player.current_room = @world.get_room_from(@player.current_room, y: -1)
    # when :east
    #   @world.move_entity_east(@player)
    # when :south
    #   @world.move_entity_south(@player)
    # when :west
    #   @world.move_entity_west(@player)
    # # when :fight, :take
    # #   @current_room.interact(@player)
    # # when :status
    # #   @player.print_status
    # when :help
    #   @game_text.help
    # when :exit
    #   exit
    # when nil
    # else
    #   @game_text.error
    # end
  end
end
