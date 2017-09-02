class Jerry < Person
  def set_name
    "Jerry".light_magenta
  end

  def set_portrait
    File.open('portraits/jerry.txt').read
  end

  def look
    puts "How do you know #{@name}'s name is #{@name}? He happens to be wearing a HELLO MY NAME IS '#{@name}' tag. It clashes with his outfit."
    puts "#{"HUMANS".yellow} are strange, aren't they? Despite his poor fashion sense, he looks like a #{"NON-THREAT".yellow}."
  end

  def to_s
    "A man named #{@name} is in the crowd. His sequined suit is disrupting your optical sensors."
  end
end
