require_relative './item'

class Tampon < Item
  def set_name
    "tampon"
  end

  def set_dialog
    YAML.load_file('dialog/items/tampon.yml')
  end

  def execute_effect(player)
    super
    player.taunt_skill += 1
  end
end
