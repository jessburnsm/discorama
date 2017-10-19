# Generic error for when a command is not found
# in our system
class BattleCommandNotFound < StandardError
end

# Responsible for instantiating correct battle command class
# based on received user input
class BattleCommand
  def self.get_command(user_input)
    case user_input
    when :dance, :d
      BattleCommand::Dance.new
    when :taunt, :t
      BattleCommand::Taunt.new
    when :rally, :r
      BattleCommand::Rally.new
    when :escape, :e
      BattleCommand::Escape.new
    else
      raise BattleCommandNotFound, user_input
    end
  end
end

# Responsible for execution of taunt command
class BattleCommand::Taunt
  def execute(player, opponent)
    BattleExecutor.new(player, opponent).taunt
  end
end

# Responsible for execution of dance command
class BattleCommand::Dance
  def execute(player, opponent)
    BattleExecutor.new(player, opponent).dance
  end
end

# Responsible for execution of rally command
class BattleCommand::Rally
  def execute(player, opponent)
    BattleExecutor.new(player, opponent).rally
  end
end

# Responsible for execution of escape command
class BattleCommand::Escape
  def execute(player, opponent)
    player.escape
    player.in_battle = false
    player.set_opponent(nil)
  end
end
