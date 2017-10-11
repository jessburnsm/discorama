require_relative './room'

class WomensBathroom < Room
  def look
    puts "This bathroom is what some #{"HUMANS".yellow} might describe as 'kitsch'"
    puts "That is to say, you've never seen so much green and pink tile in one place before."
  end

  def talk
    puts "You decide to run your weather subroutine and begin to recite the forecast for the next 5 days."
    puts "Unfortunately, due to an OS upgrade bug, you can only forecast the weather in the form of puns."
    puts "'When the fog burns off tomorrow morning, it won’t be mist.'"
  end

  def to_s
    "You are in the women's bathroom. It is currently devoid of #{"HUMAN".yellow} females."
  end

  def initialize_content
    add_content(Fannie.new(self).set_target_data)
  end
end
