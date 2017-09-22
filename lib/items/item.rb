class Item
  require 'colorize'

  def initialize(room = nil)
    @name = set_name
    @room = room
    @game_text = GameText.new
  end

  def execute_effect(player)
  end

  def key
    name.uncolorize.downcase.to_sym
  end

  def set_target_data
    { key => self }
  end

  def name
    @name.to_s.cyan
  end

  def talk
    puts "DEFAULT"
  end

  def take(player)
    puts "You take the #{name}"
    @room.remove_content(key)
    player.add_to_inventory(self)
  end

  def look
    puts "DEFAULT"
  end

  def set_name
    "DEFAULT"
  end

  def to_s
  end
end

class Umbrella < Item
  def set_name
    "umbrella"
  end

  def execute_effect(player)
    puts "You twirl the #{name}. It has a soothing effect and you heal for +5."
    puts "Alarmingly, the umbrella disintegrates right after."
    player.heal(5)
  end

  def look
    puts "The #{name} is polka-dotted."
    puts "It appears to have been abandoned, as there hasn't been rain in New Atlanta for days."
    puts "Looking at the pattern of the #{name} puts you at ease. Odd."
  end

  def talk
    puts "You attempt to strike up a conversation with the #{name} but it doesn't seem to be responsive."
    puts "You take mild offense to this development."
  end

  def to_s
    "There is an #{name} propped up against the far wall of the room."
  end
end
