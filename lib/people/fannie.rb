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

end
