class Person
  require 'colorize'

  def initialize
    @name = name
    @portrait = set_portrait
    @game_text = GameText.new
  end

  def name
    @name ||= set_name.magenta
  end

  def talk
    puts @portrait
    puts "Hey there! My name is #{@name}"
  end

  def take
    puts "Forcibly abducting #{"HUMANS".yellow} is illegal. For now."
  end

  def look
  end

  def set_name
    "DEFAULT"
  end

  def set_portrait
    "DEFAULT"
  end

  def to_s
  end
end
