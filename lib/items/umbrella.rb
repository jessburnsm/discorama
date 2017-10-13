require_relative './item'

class Umbrella < Item
  def set_name
    "umbrella"
  end

  def set_dialog
    YAML.load_file('dialog/umbrella.yml')
  end

  def execute_effect(player)
    puts eval("\"" + @dialog[:execute] + "\"")
    player.heal(5)
  end
end
