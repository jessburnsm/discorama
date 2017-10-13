class Item
  require 'colorize'

  def initialize(room = nil)
    @name = set_name
    @room = room
    @dialog = set_dialog
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

  def is_hostile?
    false
  end

  def look
    puts eval("\"" + @dialog[:look] + "\"")
  end

  def talk
    puts eval("\"" + @dialog[:talk] + "\"")
  end

  def take(player)
    puts eval("\"" + @dialog[:take] + "\"")
    @room.remove_content(key)
    player.add_to_inventory(self)
  end

  def to_s
    eval("\"" + @dialog[:room_description] + "\"")
  end
end
