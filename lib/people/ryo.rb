require_relative './person'

class Ryo < Person
  def set_name
    "boy"
  end

  def set_dialog
    YAML.load_file('dialog/ryo.yml')
  end

  def look
    look = @talk_cycle < 1 ? @dialog[:look] : @dialog[:look_2]
    puts eval("\"" + look + "\"")
  end

  def talk_cycle_1
    reset_target_data("Ryo")
    super
  end

  def to_s
    s = @talk_cycle < 1 ? @dialog[:room_description] : @dialog[:room_description_2]
    eval("\"" + s + "\"")
  end
end
