require_relative './person'

class Fannie < Person
  def set_name
    "Fannie"
  end

  def set_portrait
    File.open('portraits/fannie.txt').read
  end

  def talk
    puts @portrait
    puts "You attempt to make a converstaion wi--"
    puts "GREETINGS PATRON WOULD YOU LIKE SOME HYGIENE.".yellow
    puts "You try to tell #{@name} that you don't need anything bu--"
    puts "PROCESSING REQUEST PARAMETERS. SANITIZING INPUT STRING.".yellow
    puts "You try to cancel the request and you--"
    puts "CURRENTLY PADDING WHITESPACE.".yellow
    puts "You resign yourself to the inevitable."
    puts "REQUEST COMPLETE.".yellow
    puts "A number of sanitary products are dispensed onto the bathroom floor."
  end

  def take
    puts "You attempt to free #{@name} from her imprisonment in the DISCORAMA women's bathroom."
    puts "Alas, she is bolted to the wall and you left your sonic screwdriver at home. You leave her be for now."
  end

  def look
    puts "It's clear that #{@name} is from a different era of robotics."
    puts "It was a time when #{'HUMANS'.yellow} thought that putting AI into everything was a good idea, even a tampon dispenser."
  end

  def to_s
    "A #{'HYGIENE-O-MATIC'.yellow} sits in the corner of the bathroom, humming softly. The word #{@name} is etched onto the front of her faceplate."
  end
end
