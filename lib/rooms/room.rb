class Room
  attr_accessor :size, :content

  def initialize
    @content = {}
    @content = initialize_content
    @game_text = GameText.new
  end

  def add_content(target)
    @content = @content.merge(target)
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

  def initialize_content
    {}
  end
end

class MensBathroom < Room
  def look
    puts "You find the smooth jazz rather relaxing."
    puts "As you look over the room a mirror catches your eye and you see your #{"MOBILE PLATFORM".yellow} in the reflection."
    puts "You wonder if the #{"PROFESSOR".yellow} would be happy you've dedicated your existence to the non-violent pursuit of dancing."
    puts "It's too bad he died in that #{"DANCE-A-THON".yellow} all those years ago. He will be #{"AVENGED".yellow}!"
  end

  def talk
    puts "It seems like now would be a great time to recite the haiku you've been working on:"
    puts "I am a robot"
    puts "A robot can dance, it's true -"
    puts "#{"HUMANS".yellow} watch my moves."
    puts "The patrons in the bathroom look alarmed. Or are they moved? They are probably just jealous of your #{"SUPERIOR".yellow} poetry."
  end

  def to_s
    "You are in the men's bathroom. For whatever reason, smooth jazz is playing over the speakers in here."
  end
end

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

  def get_content
    { fannie: Fannie.new }
  end
end

class Dancefloor < Room
  def look
    puts "The dancefloor is the largest area of the club."
    puts "The floor lights up and changes colors as the music plays."
  end

  def talk
    puts "You attempt to start a conversation with yourself, but the music is too loud."
    puts "Instead, you start singing along to the current song."
  end

  def to_s
    "You are at the dancefloor. This is the heart of the #{@game_text.discorama} where #{"HUMANS".yellow} have exercised their dancing authority. Not for long though."
  end
end

class Lounge < Room
  def to_s
    "You are in the #{@game_text.discorama} lounge. A sign claims that smoking is not permitted. You observe several #{"HUMANS".yellow} smoking. Odd."
  end
end

class Bar < Room
  def to_s
    "You are in the #{@game_text.discorama} bar. Souvenir cups litter the bartop."
  end
end
