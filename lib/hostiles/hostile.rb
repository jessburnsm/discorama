require_relative '../utilities/actor'

class Hostile < Actor
  attr_accessor :dance_skill, :taunt_skill, :rally_skill,
    :taunt_bonus, :dance_bonus

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
    @taunt_bonus = 0
    @dance_bonus = 0

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
    @name.to_s.red
  end

  def is_hostile?
    true
  end

  ######################################
  # Battle
  ######################################
  def alive?
    @hp > 0 && @cp > 0
  end

  def battle
    return defeat if !alive?

    # Randomly choose an action to execute
    BattleExecutor.new(self, @player).send(@actions.sample)
  end

  def battle_cycle_1
    puts eval("\"" + @dialog[:battle_start] + "\"")
  end

  def battle_cycle_2
    puts eval("\"" + @dialog[:battle_start_2] + "\"")
  end

  def current_status
    puts
    puts @game_text.error(name + " status")
    puts "HP: #{@hp}/#{MAX_HP}"
    puts "CP: #{@cp}/#{MAX_CP}"
  end

  def defeat
    puts "opponent defeated!"
  end

  def heal(amount)
    @hp += amount
    @hp = [@hp, MAX_HP].min
    puts "#{name} has gained #{amount} hp!"
  end

  def hurt(amount)
    @hp -= amount
    puts "#{name} was wounded and took #{amount} physical damage."
  end

  def init_battle
    @battle_cycle < 1 ? battle_cycle_1 : battle_cycle_2
    @battle_cycle = @battle_cycle + 1
  end

  def insult(amount)
    @cp -= amount
    puts "#{name} spirit was broken and took #{amount} reputation damage."
  end

  def morale_boost(amount)
    @cp += amount
    @cp = [@cp, MAX_CP].min
    puts "#{name} has gained #{amount} cp!"
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
