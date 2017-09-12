class Room
  attr_accessor :size, :content

  def initialize
    @content = get_content
    @game_text = GameText.new
  end

  def get_target(target)
    @content[target]
  end

  def has_target?(target)
    @content.key?(target)
  end

  def look
    puts "LOOK"
  end

  def talk
    puts "TALK"
  end

  def to_s
    "You are in a #{@size} room. It is #{@adjective}."
  end

  private

  def get_content
    {}
    # [Monster, Potion, Sword].sample.new
  end
end

class Entrance < Room
  def look
    puts "The entrance of the DISCORAMA is..."
  end

  def talk
    puts "You begin to chatter to yourself. The #{"HUMANS".yellow} look mildly concerned."
  end

  def to_s
    "You are in the entrance of the DISCORAMA. A number of #{"HUMANS".yellow} are here. There are no other robots."
  end

  def get_content
    { jerry: Jerry.new }
  end
end

class MensBathroom < Room
  def to_s
    "You are in the men's bathroom."
  end
end

class WomensBathroom < Room
  def to_s
    "You are in the women's bathroom."
  end
end

class Dancefloor < Room
  def to_s
    "You are at the dancefloor."
  end
end

class Lounge < Room
  def to_s
    "You are in the DISCORAMA lounge."
  end
end

class Bar < Room
  def to_s
    "You are in the DISCORAMA bar."
  end
end
