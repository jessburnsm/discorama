require_relative './person'
require_relative '../items/item'

class Fannie < Person
  def set_name
    "Fannie"
  end

  def set_portrait
    File.open('portraits/fannie.txt').read
  end

  def set_dialog
    YAML.load_file('dialog/people/fannie.yml')
  end

  def talk_cycle_1
    super
    add_item_to_room(Tampon)
  end
end
