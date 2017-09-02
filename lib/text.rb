class Text
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
  PLAYER_NAME = "DANCEBOT 9000".green
  DISCORAMA = "DISC".magenta+ "-O-".green + "RAMA".magenta
  PROMPT = "ENTER COMMAND: ".green
  ERROR = "ERROR: COMMAND NOT FOUND IN EXECUTABLE DANCEBOT_9000.vb".red
  EXIT = "HALTING DANCEBOT_9000 PROCESS. HASTA LA VISTA.".green
  MAP_ERROR = "ERROR: PATH UNAVAILABLE".red
  WARNING = "WARNING: UNSPECIFIC COMMAND.".yellow
  WARNING_SUB = "Someday robots may be able to pass through walls. Sadly, today is not that day."

  def self.error
    puts ERROR
  end

  def self.exit
    puts EXIT
  end

  def self.map_barrier
    puts MAP_ERROR
  end

  def self.prompt
    print PROMPT
  end

  def self.warning
    puts WARNING
    puts WARNING_SUB
  end

  ###################
  ### Game Intro ###
  ##############################################
  def self.intro
    system "clear"
    puts "INITIATING DANCEBOT_9000 PROCESS".green
    puts "The year is 3017."
    puts "Robots have become a part of everyday life and can be found in the workforce and at home."
    puts "However, there's one place that robots haven't been able #{"DOMINATE".yellow} just yet: the dancefloor."
    puts "You are #{PLAYER_NAME} and you are ready to usher in a new era of #{"SUPERIOR DANCING ABILITY".yellow}."
    puts "You've come to the #{"GROOVIEST".yellow} club in the world to battle the greatest #{"HUMAN".yellow} dancers of this generation."
    puts "Through your #{"DANCING SUPREMACY".yellow} you hope to inspire young robots everywhere to come on down to #{"BOOGIE TOWN".yellow}."
    puts "A neon sign guides the way..."
    load 'portraits/discorama.rb'
  end

  ###################
  ### Help ###
  ##############################################
  def self.help
    puts ""
    puts "GREETINGS #{PLAYER_NAME}"
    puts "OBJECTIVE: Battle #{"HUMANS".yellow} to become the #{"GREATEST DANCER ON EARTH".yellow}"
    puts "NAVIGATION: Use #{"north, east, south, or west".blue} to navigate the #{DISCORAMA}"
    puts "OBSERVATION: Use #{"look".blue} to view the #{DISCORAMA}"
    puts "ENGAGEMENT: Use #{"talk".blue} to converse with #{"HUMANS".yellow} and #{"take".blue} to pickup objects"
    puts "TERMINATION: Use #{"exit".blue} to abort the mission early."
  end

  #########################
end
