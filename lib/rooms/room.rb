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
    "You are in the entrance of the #{Text::DISCORAMA}. A number of #{"HUMANS".yellow} are here. There are no other robots."
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
    "You are in the #{Text::DISCORAMA} lounge."
  end
end

class Bar < Room
  def to_s
    "You are in the #{Text::DISCORAMA} bar."
  end
end
