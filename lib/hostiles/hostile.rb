require_relative '../utilities/actor'

class Hostile < Actor
  MAX_HP = 100
  MAX_CP = 100
  DANCE_SKILL = 1
  TAUNT_SKILL = 1
  RALLY_SKILL = 1

  def initialize(room = nil)
    super(room)
    @hp = self.class::MAX_HP
    @cp = self.class::MAX_CP
    @dance_skill = self.class::DANCE_SKILL
    @taunt_skill = self.class::TAUNT_SKILL
    @rally_skill = self.class::RALLY_SKILL

    # Hostile will load actions array according to skills,
    # favoring their particular strengths
    @actions = []
    @dance_skill.times { @actions << :dance }
    @taunt_skill.times { @actions << :taunt }
    @rally_skill.times { @actions << :rally }

    # Battle cycle keeps track of how many times the player
    # has used the battle command on this hostile
    @battle_cycle = 0
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
  MAX_HP = 50
  MAX_CP = 50
  DANCE_SKILL = 1
  TAUNT_SKILL = 3
  RALLY_SKILL = 1

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
