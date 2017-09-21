class Person
  require 'colorize'

  def initialize(room = nil)
    @name = set_name
    @room = room
    @portrait = set_portrait
    @game_text = GameText.new
    @talk_cycle = 0
  end

  def reset_target_data(new_name)
    @room.remove_content(key)
    @name = new_name
    @room.add_content(set_target_data)
  end

  def key
    name.uncolorize.downcase.to_sym
  end

  def set_target_data
    { key => self }
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
