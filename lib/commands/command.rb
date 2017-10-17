# Generic error for when a command is not found
# in our system
class CommandNotFound < StandardError
end

# Generic error for when a target is not found
# in our system
class TargetNotFound < StandardError
end

# Generic error for when a battle target is not found
# in our system
class BattleNotFound < StandardError
end

# Generic error for when a target is not found
# in our system
class ItemNotFound < StandardError
end

# Responsible for instantiating correct command class
# based on received user input
class Command
  def self.get_command(user_input)
    case user_input
    when :north, :east, :south, :west, :n, :e, :s, :w
      Command::Movement.new(user_input)
    when :look, :l
      Command::Look.new
    when :talk, :tal
      Command::Talk.new
    when :take, :tak
      Command::Take.new
    when :inventory, :i
      Command::Inventory.new
    when :status, :st
      Command::Status.new
    when :use, :u
      Command::Use.new
    when :help, :h
      Command::Help.new
    when :exit, :e
      Command::Exit.new
    when :battle, :b
      Command::Battle.new
    else
      raise CommandNotFound, user_input
    end
  end
end

# Responsible for execution of look command
class Command::Look
  def execute(target, current_room, *)
    if target && current_room.has_target?(target)
      current_room.get_target(target).look
    elsif target
      raise TargetNotFound, target
    else
      current_room.look
    end
  end
end

# Responsible for execution of talk command
class Command::Talk
  def execute(target, current_room, *)
    if target && current_room.has_target?(target)
      current_room.get_target(target).talk
    elsif target
      raise TargetNotFound, target
    else
      current_room.talk
    end
  end
end

# Responsible for execution of take command
class Command::Take
  def execute(target, current_room, world, player)
    if target && current_room.has_target?(target)
      current_room.get_target(target).take(player)
    else target
      raise TargetNotFound, target
    end
  end
end

# Responsible for execution of inventory command
class Command::Inventory
  def execute(target, current_room, world, player)
    player.inventory
  end
end

# Responsible for execution of status command
class Command::Status
  def execute(target, current_room, world, player)
    player.current_status
  end
end

# Responsible for execution of use command
class Command::Use
  def execute(target, current_room, world, player)
    if target && player.has_item?(target)
      player.use(target)
    else target
      raise ItemNotFound, target
    end
  end
end

# Responsible for execution of help command
class Command::Help
  def execute(*)
    GameText.new.help
  end
end

# Responsible for execution of exit command
class Command::Exit
  def execute(*)
    exit
  end
end

class Command::Movement
  # MOVE_MAPPING = {
  #   north: { y: -1, x: 0 },
  #   south: { y: 1, x: 0 }
  # }

  def initialize(direction)
    @direction = direction
  end

  def execute(target, current_room, world, player)
    case @direction
    when :north, :n
      world.move_entity_north(player)
    when :east, :e
      world.move_entity_east(player)
    when :west, :w
      world.move_entity_west(player)
    when :south, :s
      world.move_entity_south(player)
    end
  #   direction_changes = MOVE_MAPPING[@direction]
  #   next_room = world.get_room(player.current_room, direction_changes)
  #   player.current_room = next_room
  # rescue InvalidMovement => e
  #   GameText.invalid_move
  end

  # Responsible for execution of battle command
  class Command::Battle
    def execute(target, current_room, world, player)
      if target && current_room.has_battle_target?(target)
        player.in_battle = true
        player.set_opponent(current_room.get_target(target))
        player.get_opponent.init_battle
      else
        raise BattleNotFound, target
      end
    end
  end
end
