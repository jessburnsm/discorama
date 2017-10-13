require_relative '../utilities/actor'

class Hostile < Actor
  MAX_HP = 100
  MAX_CP = 100

  def initialize(room = nil)
    super(room)
    @hp = self.class::MAX_HP
    @cp = self.class::MAX_CP
  end

  def is_hostile?
    true
  end

  def battle
    puts "battle placeholder"
  end
end

class Princess < Hostile
  attr_accessor :hp, :cp

  MAX_HP = 100
  MAX_CP = 50

  def set_name
    "Princess"
  end

  def set_dialog
    YAML.load_file('dialog/princess.yml')
  end

  def set_portrait
    #File.open('portraits/jerry.txt').read
  end
end
