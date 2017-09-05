# Responsible for instantiating correct command class
# based on received user input
class Command
  def self.get_command(user_input)
    case user_input
    when :look
      Command::Look.new
    when :talk
      Command::Talk.new
    when :exit
      Command::Exit.new
    else
      raise CommandNotFound, user_input
    end
  end
end

# Generic error for when a command is not found
# in our system
class CommandNotFound < StandardError
end

# Responsible for execution of look command
class Command::Look
  def execute(target, current_room)
    if target && current_room.has_target?(target)
      current_room.content[target].send(:look)
    elsif target
      puts "CANNOT FIND TARGET"
    else
      puts "LOOK AT ROOM"
    end
  end
end

# Responsible for execution of talk command
class Command::Talk
  def execute(target, current_room)
    if target && current_room.has_target?(target)
      current_room.content[target].send(:talk)
    elsif target
      puts "CANNOT FIND TARGET"
    else
      puts "TALK TO ROOM"
    end
  end
end

# Responsible for execution of exit command
class Command::Exit
  def execute(*)
    exit
  end
end