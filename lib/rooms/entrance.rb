require_relative './room'

class Entrance < Room
  def look
    puts "The entrance of the #{@game_text.discorama} is filled with #{@game_text.emphasis('humans')}, young and old."
    puts "It is one of the most popular attractions in New Atlanta, as it is one of the only buildings that survived the #{@game_text.emphasis('Robot Revolution')} of 2080."
    puts "(Undergound Atlanta also survived, but no one goes there, so whatever)."
    puts ""
    puts "When (old) Atlanta burned to the ground, this club remained open and accepted all patrons, both #{@game_text.emphasis('human')} and #{@game_text.emphasis('robotic')}."
    puts ""
    puts "The club entrance is the only room with windows, though they appear to have been boarded up long ago. Suspicious."
    puts "The carpet is especially dingy here. Gross. No one needs this reminder of how old the place is."
    puts ""
    puts "Your auditory receptors are registering music from the dancefloor, to the #{@game_text.highlight('south')}."
    puts "Bathrooms are accessible from the entrance as well, to the #{@game_text.highlight('east')} and #{@game_text.highlight('west')}. The night is young and the lines are still short."
  end

  def talk
    puts "You begin to sing your favorite song, 'Daisy Bell'. The #{@game_text.emphasis('humans')} in the room look mildly alarmed."
    puts "When you finish, the #{@game_text.emphasis('humans')}, give you polite applause and avoid eye contact."
  end

  def to_s
    "You are in the entrance of the DISCORAMA. A number of #{@game_text.emphasis('humans')} are here. There are no other robots."
  end

  def initialize_content
    add_content(Jerry.new(self).set_target_data)
    add_content(Ryo.new(self).set_target_data)
    add_content(Umbrella.new(self).set_target_data)
    add_content(Princess.new(self).set_target_data)
  end
end
