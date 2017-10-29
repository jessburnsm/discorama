require_relative '../utilities/actor'

class Item < Actor
  def execute_effect(player)
    @game_text.read_from_yaml(@dialog[:execute], name)
  end

  def name
    @name.to_s.cyan
  end

  def deletable?
    true
  end

  def description
    @game_text.process(@dialog[:inventory_description])
  end

  def take(player)
    super
    remove_item_from_room(key)
    give_to_player(player, self)
  end
end
