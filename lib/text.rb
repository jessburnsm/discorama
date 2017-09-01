class Text
  #:black   => 0, :light_black    => 60,
  #:red     => 1, :light_red      => 61,
  #:green   => 2, :light_green    => 62,
  #:yellow  => 3, :light_yellow   => 63,
  #:blue    => 4, :light_blue     => 64,
  #:magenta => 5, :light_magenta  => 65,
  #:cyan    => 6, :light_cyan     => 66,
  #:white   => 7, :light_white    => 67,
  #:default => 9
  require 'colorize'

  ###################
  ### Game Globals ###
  ##############################################
  def self.discorama
    "DISC".magenta+ "-O-".green + "RAMA".magenta
  end

  def self.discorama_sign
    puts "     ******************************"
    puts "     * " + ("Welcome to the ".green + self.discorama).blink + " *"
    puts "     ******************************"
    puts "                   ||"
    puts "                   ||"
    puts "                   ||"
    puts "                   ||"
    puts "                   ||"
  end

  def self.disco_royalty
    "disco royalty".blue
  end

  def self.prompt
    print "What's the plan, man? ".light_blue
  end

  ###################
  ### Game Intro ###
  ##############################################
  def self.intro
    system "clear"
    self.discorama_sign
    puts "Groovy, baby! You've stepped out into the swingin' city nightlife tonight to prove you are " + Text::disco_royalty + "!"
    puts "You walk into the most happenin' club around, the disco dance talk of the town. A large neon sign guides the way."
  end

  #################
  ### Game Exit ###
  ##############################################
  def self.exit
    "Catch ya on the flip side, sweet-cheeks!"
  end

  ###################
  ### Help ###
  ##############################################
  def self.help
    "\n" +
    "Hey there baby-cakes! The name of this dicso game to to become #{disco_royalty}!" + "\n" +
    "How do you do that, you ask? You have to dance battle your way to the top!" + "\n" +
    "You can move around the club by using the commands: " + "north, east, south, or west".red + "\n" +
    "You can use your eye-beams to assess the situation with the command " + "look".red + "\n" +
    "You can talk to your fellow groovy club goers by using the command " + "talk".red + "\n" +
    "You can initiate a dance battle with the command " + "dance".red + "\n" +
    "You can pick up items with the command " + "take".red + "\n" +
    "If you need to peace-out early (lame-o), you can use the command " + "exit".red + "\n"
  end

  #########################
  ### Room Intros + Map ###
  ##############################################
  def self.bar
    "You are at the #{Text::discorama} bar. The grooviest bar in town.\n...at least, that's what the souvenir cups say."
  end

  def self.dancefloor
    "You are at the dancefloor of the #{Text::discorama}"
  end

  def self.entrance
    "You are in the entrance of the #{Text::discorama}\nThere are several cool cats hangin' out here."
  end

  def self.lounge
    "You are in the lounge of the #{Text::discorama}"
  end

  def self.mensbathroom
    "You are in the men's bathroom of the #{Text::discorama}\nInexplicably, smooth jazz is playing over the speakers."
  end

  def self.womensbathroom
    "You are in the women's bathroom of the #{Text::discorama}\nIt's alarmingly dark in here."
  end

  def self.map_barrier
    "Uh-oh daddy-o! There's no more club over there! Time to turn this party around.".red
  end
  ##############################################

end
