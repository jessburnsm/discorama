require_relative './person'

class Ryo < Person
  def set_name
    "boy"
  end

  def set_portrait
    ''
    #File.open('portraits/jerry.txt').read
  end

  def look
    case @talk_cycle
    when 0
      puts "The #{name} looks young enough to still receive an allowance. What's he doing in a place like this?"
    else
      puts "#{name} is still using the vending machine."
      puts "You wonder what the connection between #{@game_text.emphasis('sailors')} and capsule toys could be."
    end
  end

  def talk
    case @talk_cycle
    when 0
      # Reset name to Ryo
      reset_target_data("Ryo")
      puts "#{name}: HElLo, I'm #{name}. HOw are... YoU?"
      puts ""
      puts "...his speech sounds stilted and unnatural, even to a robot. Yikes."
      puts ""
      puts "#{name}: HEy. Do yOU hAppEn to KNOw wheRe #{@game_text.emphasis('sailors')} hang ouT?"
      puts ""
      puts "You do not, in fact, know where #{@game_text.emphasis('sailors')} can be found."
      puts "You inform #{name} that the nearest open water is several hundred miles away."
      puts ""
      puts "#{name}: I sEE."
      puts ""
      puts "#{name} turns his attention back to the vending machine. Without another word."
    else
      puts "#{name} is too busy with the vending machine to speak to you. Rude."
    end

    @talk_cycle += 1
  end

  def to_s
    case @talk_cycle
    when 0
      "A young #{name} in a leather jacket is continuously feeding coins into a vending machine."
    else
      "#{name} is still using the vending machine. Is he looking for a specific capsule toy, perhaps?"
    end
  end
end
