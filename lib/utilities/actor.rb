# Generic class that provides a framework for interactive elements
# in the game
#
# This includes items, people, and enemies
class Actor
  require 'colorize'
  require 'yaml'

  def initialize(room = nil)
    @name = set_name
    @room = room
    @game_text = GameText.new

    # This needs to be implemented per child class
    @dialog = set_dialog
  end

  def key
    @name.uncolorize.downcase.to_sym
  end

  def set_target_data
    { key => self }
  end

  # If the actor's key/name changes as part of
  # the game, the room needs to be updated
  def reset_target_data(new_name)
    @room.remove_content(key)
    @name = new_name
    @room.add_content(set_target_data)
  end

  # Allows actors to add other actors to the game
  def add_item_to_room(item_class)
    @room.add_content(item_class.new(@room).set_target_data)
  end

  # Allow actors to remove other actors from the game
  def remove_item_from_room(key)
    @room.remove_content(key)
  end

  # Allow actors to add something to the player inventory
  def give_to_player(player, item_class)
    player.add_to_inventory(item_class)
  end

  # By default, no actors are hostile
  def is_hostile?
    false
  end

  ## DIALOG COMMANDS
  def look
    @game_text.read_from_yaml(@dialog[:look], name)
  end

  def take(*)
    @game_text.read_from_yaml(@dialog[:take], name)
  end

  def talk
    @game_text.read_from_yaml(@dialog[:talk], name)
  end

  def to_s
    @game_text.process(@dialog[:room_description], name)
  end
end
