require_relative './person'

class Jerry < Person
  def set_name
    "Jerry"
  end

  def set_portrait
    File.open('portraits/jerry.txt').read
  end

  def look
    puts "How do you know #{name}'s name is #{name}? He happens to be wearing a HELLO MY NAME IS '#{name}' tag."
    puts "It clashes tragically with his outfit."
    puts "#{@game_text.emphasis('humans')} are strange, aren't they? Despite his poor fashion sense, he looks like a #{@game_text.emphasis('non-threat')}."
    puts "You could probably #{@game_text.highlight('talk')} to #{name}."
  end

  def talk
    case @talk_cycle
    when 0
      puts @portrait
      puts "#{name}: 'Hey-o, fellow disc-o amig-o! Did you come out for the competition? I've never seen a robot compete before!'"
      puts "#{name}: 'I'm real glad you're here though -- it's time to show the #{@game_text.emphasis('elite feet')} some elite defeat!'"
      puts ""
      puts "The #{@game_text.emphasis('elite feet')} is a team of the best dancers in the world. They dominate the competition every year."
      puts ""
      puts "#{name}: 'You're looking a little lost though, friend-o. Robots usually come with a #{@game_text.highlight('help')} command, right?'"
      puts "#{name}: 'Check back when you've got your bearings!'"
    when 1
      puts "THIS IS TALK CYCLE 2"
    else
      puts "#{name} is busy dancing, despite not being on the dancefloor."
      puts "Though the entrance of the club is dimly lit, the light that is present is reflecting obnoxiously off the sequins of #{name}'s suit."
      puts "You wonder briefly if robots can go blind."
    end

    @talk_cycle += 1
  end

  def to_s
    "A man named #{name} is in the crowd. His sequined suit is disrupting your optical sensors."
  end
end
