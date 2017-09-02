class Room
  attr_accessor :size, :content

  def initialize
    @content = get_content
  end

  def interact(player)
    if @content
      @content.interact(player)
      @content = nil
    end
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
  def to_s
    "You are in the entrance of the #{Text::DISCORAMA}"
  end

  def get_content
    { jerry: Jerry.new }
  end
end

class MensBathroom < Room
  def to_s
    ""
  end
end

class WomensBathroom < Room
  def to_s
    ""
  end
end

class Dancefloor < Room
  def to_s
    ""
  end
end

class Lounge < Room
  def to_s
    ""
  end
end

class Bar < Room
  def to_s
    Text::bar
  end
end
