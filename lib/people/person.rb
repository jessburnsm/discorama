class Person
  require 'colorize'

  def initialize
    @name = set_name
    @portrait = set_portrait
  end

  def talk
  end

  def take
  end

  def look
  end

  def set_name
    "DEFAULT"
  end

  def set_portrait
    "DEFAULT"
  end

  def to_s
  end
end

class Jerry < Person
  def set_name
    "Jerry".light_magenta
  end

  def set_portrait
    File.open('portraits/jerry.txt').read
  end

  def talk
    puts @portrait
    puts "Hey there! My name is #{@name}"
  end

  def take
    puts "Yikes! You can't take Jerry!"
  end

  def look
    puts "How do you know #{@name}'s name is #{@name}? He happens to be wearing a HELLO MY NAME IS #{@name} tag. Nice."
  end

  def to_s
    "A man named #{@name} is here. His lime green suit makes him easy to spot in the crowd."
  end
end
