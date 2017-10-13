require_relative '../utilities/actor'

class Person < Actor
  def initialize(room = nil)
    super(room)
    @talk_cycle = 0
  end

  def name
    @name.to_s.magenta
  end

  def talk
    #puts @portrait
    if @talk_cycle < 1
      puts eval("\"" + @dialog[:talk] + "\"")
    else
      puts eval("\"" + @dialog[:talk_2] + "\"")
    end

    @talk_cycle = @talk_cycle + 1
  end
end
