require_relative '../utilities/actor'

class Hostile < Actor
  MAX_HP = 100
  MAX_CP = 100

  def initialize(room = nil)
    super(room)
    @hp = self.class::MAX_HP
    @cp = self.class::MAX_CP
  end

  def name
    @name.to_s.cyan
  end

  def is_hostile?
    true
  end

  def init_battle
    puts "battle opening line"
  end

  def battle
    puts "check if opponent is dead"
    # Choose action
    puts "opponent takes turn"
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
