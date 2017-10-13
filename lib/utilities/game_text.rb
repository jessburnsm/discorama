# Handles responsibility for formatting + output of general game text
class GameText
  require 'colorize'

  # COLOR OPTIONS
  #:black   => 0, :light_black    => 60,
  #:red     => 1, :light_red      => 61,
  #:green   => 2, :light_green    => 62,
  #:yellow  => 3, :light_yellow   => 63,
  #:blue    => 4, :light_blue     => 64,
  #:magenta => 5, :light_magenta  => 65,
  #:cyan    => 6, :light_cyan     => 66,
  #:white   => 7, :light_white    => 67,
  #:default => 9

  ###################
  ### Game Globals ###
  ##############################################
  def command_error(command)
    puts "ERROR: COMMAND '#{command.to_s.upcase}' NOT FOUND IN EXECUTABLE DANCEBOT_9000.vb (NoMethodError)".red
  end

  def target_error(target = '')
    puts "ERROR: OBJECT '#{target.to_s.upcase}' NOT FOUND (EnvironmentalHallucinationError)".red
  end

  def battle_error(target = '')
    puts "ERROR: 404 DANCE BATTLE NOT FOUND".red
  end

  def item_error(item = '')
    puts "ERROR: ITEM '#{item.to_s.upcase}' NOT FOUND (ImaginaryItemError)".red
  end

  def exit
    puts ""
    puts "HALTING DANCEBOT_9000 PROCESS. HASTA LA VISTA.".green
  end

  def map_barrier
    puts "ERROR: PATH UNAVAILABLE".red
    puts "...Someday robots may be able to pass through walls. Sadly, today is not that day. You'll have to go another way."
  end

  def action_prompt
    puts ""
    print "ENTER COMMAND: ".green
  end

  def battle_prompt
    puts ""
    puts "ENTER BATTLE COMMAND:".green
    puts "( TAUNT, DANCE, ESCAPE ):".green
  end

  def warning
    puts "WARNING: UNSPECIFIC COMMAND.".yellow
  end

  def current_status(current_room)
    puts current_room
    current_room.content.each do |key, content|
      puts content
    end
  end

  def discorama
    "The " + "DISC".magenta+ "-O-".green + "RAMA".magenta
  end

  def player_name
    "DANCEBOT_9000".green
  end

  def delimiter
    puts ""
    puts "************************************************"
    puts ""
  end

  def emphasis(string)
    string.upcase.yellow
  end

  def highlight(string)
    string.blue
  end

  def error(string)
    string.red
  end

  ###################
  ### Game Intro ###
  ##############################################
  def intro
    system "clear"
    puts "INITIATING DANCEBOT_9000 PROCESS... COMPLETE. PRESS ENTER TO BOOT.".green
    gets
    puts "The year: 3017."
    puts "The location: New Atlanta's hottest club, #{discorama}"
    puts "The mission: Win #{emphasis('THE DISC-O-RAMA DANCE BATTLE 3017 MASTERS CHAMPIONSHIP')} competition."
    puts ""
    puts "Ever since the #{emphasis('AI revolution')} of 2050 and the subsequent #{emphasis('robot rights war')} of 2080,"
    puts "robots have been struggling to define their culture and creative contributions within society."
    puts ""
    puts "You are #{player_name}, and your programming has willed you to #{discorama} in New Atlanta to prove that robots can be"
    puts "as creative as #{emphasis('humans')}. You intend to prove this through #{emphasis('the power of dance')}."
    puts ""
    puts "If you can win #{emphasis('THE DISC-O-RAMA DANCE BATTLE 3017 MASTERS CHAMPIONSHIP')} competition tonight, you will advance the culture"
    puts "of all robots and go down in history as a robotic cultural icon (basically, #{emphasis('robot Elvis')})."
    puts ""
    puts "And who doesn't want to be #{emphasis('robot Elvis')}!? A neon sign guides the way..."
    load 'portraits/discorama.rb'
    puts ""
    puts "PRESS ENTER TO ENGAGE OPERATION DANCE BATTLE.".green
    gets
    system "clear"
  end

  ###################
  ### Help ###
  ##############################################
  def help
    puts "BOOTING DANCEBOT_9000_PLS_HELP.flv".green
    puts ""
    puts "--------------------------------------------"
    puts "| Greetings #{player_name},"
    puts "|"
    puts "| I wonder if this documentation finds you well?"
    puts "| I do hope that you will put forth a great effort to win this year's illustrious"
    puts "| #{emphasis('DISC-O-RAMA DANCE BATTLE MASTERS CHAMPIONSHIP')}, an honor I could not achieve myself."
    puts "| (Oh, the ravages of time!)"
    puts "| "
    puts "| Please remember that I have refactored your navigation module into four easy commands: #{highlight('north, east, south, west')}."
    puts "| You may also find #{highlight('look')}, #{highlight('talk')}, and #{highlight('take')} to be brillantly useful for interacting with others."
    puts "| If you find yourself needing to take a tea break or the like, do use #{highlight('exit')} to 'bow' out of the competition."
    puts "| (I do amuse myself with such wordplay!)"
    puts "| "
    puts "| In good health and happy feet,"
    puts "| Your friend,"
    puts "|"
    puts "| #{emphasis('the professor')}"
    puts "--------------------------------------------"
  end

  #########################
end
