require_relative './person'
require_relative '../items/license'

class Gwenda < Person
  def set_name
    "gypsy"
  end

  def set_dialog
    YAML.load_file('dialog/people/gwenda.yml')
  end

  def look
    look = @talk_cycle < 1 ? @dialog[:look] : @dialog[:look_2]
    @game_text.read_from_yaml(look, name)
  end

  def talk_cycle_1
    reset_target_data("Gwenda")
    super
    add_item_to_room(License)
  end

  def to_s
    s = @talk_cycle < 1 ? @dialog[:room_description] : @dialog[:room_description_2]
    @game_text.process(s, name)
  end
end
