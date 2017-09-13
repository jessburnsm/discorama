class Person
  require 'colorize'

  def initialize
    @name = set_name
    @portrait = set_portrait
    @game_text = GameText.new
    @talk_cycle = 0
  end

  def set_target_data
    { name.uncolorize.downcase.to_sym => self }
  end

  def name
    @name.to_s.magenta
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
