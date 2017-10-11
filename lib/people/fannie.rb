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
    YAML.load_file('dialog/fannie.yml')
  end

  def talk
    puts @portrait

    if @talk_cycle < 1
      puts eval("\"" + @dialog[:talk] + "\"")
      add_item_to_room(Umbrella)
    else
      puts eval("\"" + @dialog[:talk_2] + "\"")
    end

    @talk_cycle = @talk_cycle + 1
  end
end
