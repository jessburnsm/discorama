# Responsible for executing actions on game objects
class ActionDirector
  def initialize(world, player)
    @world = world
    @player = player
    @current_room = @world.get_room_of(@player)
  end

  def call(action)
    puts ""
    case action[:command]
    when :look, :talk, :take
      execute_interactive_action(action[:command], action[:target])
    when :north
      @world.move_entity_north(@player)
      #@player.current_room = @world.get_room_from(@player.current_room, y: -1)
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
      GameText::help
    when :exit
      exit
    when nil
    else
      GameText::error
    end
  end

  private

  # Sends command to game object, if applicable
  #
  # ==== Arguments
  #
  # * +command+ - the action/method that will be sent to the object
  # * +target+ - the game object that will receive the action
  def execute_interactive_action(command, target)
    if target && @current_room.content.key?(target)
      @current_room.content[target].send(command)
    else
      GameText::warning
    end
  end
end
