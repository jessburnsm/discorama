class Person
  require 'colorize'
  require 'yaml'

  def initialize(room = nil)
    @name = set_name
    @room = room
    @dialog = set_dialog
    @portrait = set_portrait
    @game_text = GameText.new
    @talk_cycle = 0
  end

  def reset_target_data(new_name)
    @room.remove_content(key)
    @name = new_name
    @room.add_content(set_target_data)
  end

  def add_item_to_room(item_class)
    @room.add_content(item_class.new(@room).set_target_data)
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

  def is_hostile?
    false
  end

  def take(*)
    puts eval("\"" + @dialog[:take] + "\"")
  end

  def look
    puts eval("\"" + @dialog[:look] + "\"")
  end

  def talk
    puts @portrait

    if @talk_cycle < 1
      puts eval("\"" + @dialog[:talk] + "\"")
    else
      puts eval("\"" + @dialog[:talk_2] + "\"")
    end

    @talk_cycle = @talk_cycle + 1
  end

  def to_s
    eval("\"" + @dialog[:room_description] + "\"")
  end
end
