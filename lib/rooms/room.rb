class Room
  require 'colorize'
  require 'yaml'

  attr_accessor :size, :content

  def initialize
    @content = {}
    @content = initialize_content
    @game_text = GameText.new

    # This needs to be implemented per child class
    @dialog = set_dialog
  end

  def add_content(target)
    @content = @content.merge(target)
  end

  def remove_content(key)
    @content.delete(key)
  end

  def get_target(target)
    @content[target]
  end

  def has_hostile?
    @content.each do |key, content|
      return true if content.is_hostile?
    end
    return false
  end

  def has_target?(target)
    @content.key?(target)
  end

  def has_battle_target?(target)
    has_target?(target) && @content[target].is_hostile?
  end

  ## DIALOG COMMANDS
  def look
    @game_text.read_from_yaml(@dialog[:look])
  end

  def take(*)
    @game_text.read_from_yaml(@dialog[:take])
  end

  def talk
    @game_text.read_from_yaml(@dialog[:talk])
  end

  def to_s
    @game_text.process(@dialog[:room_description])
  end

  private

  def initialize_content
    {}
  end
end

class Entrance < Room
  def set_dialog
    YAML.load_file('dialog/rooms/entrance.yml')
  end

  def initialize_content
    add_content(Jerry.new(self).set_target_data)
    add_content(Ryo.new(self).set_target_data)
    add_content(Umbrella.new(self).set_target_data)
  end
end

class Dancefloor < Room
  def set_dialog
    YAML.load_file('dialog/rooms/dancefloor.yml')
  end

  def initialize_content
    add_content(Princess.new(self).set_target_data)
  end
end

class MensBathroom < Room
  def set_dialog
    YAML.load_file('dialog/rooms/mens_bathroom.yml')
  end
end

class Lounge < Room
  def set_dialog
    YAML.load_file('dialog/rooms/lounge.yml')
  end
end

class Bar < Room
  def set_dialog
    YAML.load_file('dialog/rooms/bar.yml')
  end
end

class WomensBathroom < Room
  def set_dialog
    YAML.load_file('dialog/rooms/womens_bathroom.yml')
  end

  def initialize_content
    add_content(Fannie.new(self).set_target_data)
  end
end
