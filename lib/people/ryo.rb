require_relative './person'

class Ryo < Person
  def set_name
    "boy"
  end

  def set_portrait
    ''
    #File.open('portraits/jerry.txt').read
  end

  def set_dialog
    YAML.load_file('dialog/ryo.yml')
  end

  def look
    if @talk_cycle < 1
      puts eval("\"" + @dialog[:look] + "\"")
    else
      puts eval("\"" + @dialog[:look_2] + "\"")
    end
  end

  def talk
    puts @portrait

    if @talk_cycle < 1
      reset_target_data("Ryo")
      puts eval("\"" + @dialog[:talk] + "\"")
    else
      puts eval("\"" + @dialog[:talk_2] + "\"")
    end

    @talk_cycle = @talk_cycle + 1
  end

  def to_s
    if @talk_cycle < 1
      eval("\"" + @dialog[:room_description] + "\"")
    else
      eval("\"" + @dialog[:room_description_2] + "\"")
    end
  end
end
