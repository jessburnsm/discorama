require_relative '../utilities/actor'

class Person < Actor
  def initialize(room = nil)
    super(room)

    # Talk cycle keeps track of how many times the player
    # has used the talk command on this person
    @talk_cycle = 0
  end

  def name
    @name.to_s.magenta
  end

  def talk
    #puts @portrait
    @talk_cycle < 1 ? talk_cycle_1 : talk_cycle_2
    @talk_cycle = @talk_cycle + 1
  end

  def talk_cycle_1
    @game_text.read_from_yaml(@dialog[:talk], name)
  end

  def talk_cycle_2
    @game_text.read_from_yaml(@dialog[:talk_2], name)
  end
end
