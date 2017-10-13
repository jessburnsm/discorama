# Generic error for when a command is not found
# in our system
class BattleCommandNotFound < StandardError
end

# Responsible for instantiating correct battle command class
# based on received user input
class BattleCommand
  def self.get_command(user_input)
    case user_input
    when :dance
      BattleCommand::Dance.new
    when :taunt
      BattleCommand::Taunt.new
    when :escape
      BattleCommand::Escape.new
    else
      raise BattleCommandNotFound, user_input
    end
  end
end

# Responsible for execution of taunt command
class BattleCommand::Taunt
  def execute(player, opponent)
    puts "taunt placeholder"
  end
end

# Responsible for execution of taunt command
class BattleCommand::Dance
  def execute(player, opponent)
    puts "dance placeholder"
  end
end

# Responsible for execution of escape command
class BattleCommand::Escape
  def execute(player, opponent)
    puts "escape placeholder"
    player.in_battle = false
  end
end
