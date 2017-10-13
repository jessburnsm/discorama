require_relative '../utilities/actor'

class Item < Actor
  def execute_effect(player)
  end

  def name
    @name.to_s.cyan
  end

  def take(player)
    super

    remove_item_from_room(key)
    give_to_player(player, self)
  end
end
