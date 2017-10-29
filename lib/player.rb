require_relative './utilities/battle_entity'

class Player
  include BattleEntity

  attr_accessor :x_coord, :y_coord, :in_battle,
    :dance_skill, :taunt_skill, :rally_skill, :taunt_bonus, :dance_bonus, :cp

  MAX_HP = 100
  MAX_CP = 50

  def initialize
    @game_text = GameText.new

    # Starting position
    @x_coord, @y_coord = 1, 0

    # Starting stats
    @hp = MAX_HP
    @cp = MAX_CP
    @dance_skill = 0
    @taunt_skill = 0
    @rally_skill = 0
    @taunt_bonus = 0
    @dance_bonus = 0

    # Battle variables
    @in_battle = false
    @opponent = nil

    @inventory = {}

    @dialog = YAML.load_file('dialog/player.yml')
  end

  def name
    @game_text.player
  end

  def current_status
    puts @game_text.information(@game_text.player + " SYSTEM STATUS")
    puts @game_text.warning("WARNING: CRITICAL DANCE FAILURE IMMINENT.") if in_danger?
    puts "HP: #{@hp}/#{MAX_HP}"
    puts "CP: #{@cp}/#{MAX_CP}"
    puts "DANCE LVL: #{@dance_skill}" + (@dance_bonus > 0 ? @game_text.information(" + #{@dance_bonus}") : "")
    puts "TAUNT LVL: #{@taunt_skill}" + (@taunt_bonus > 0 ? @game_text.information(" + #{@taunt_bonus}") : "")
    puts "RALLY LVL: #{@rally_skill}"
    puts "---------"
    puts
  end

  ######################################
  # Inventory
  ######################################
  def add_to_inventory(item)
    @inventory = @inventory.merge(item.set_target_data)
  end

  def has_item?(target)
    @inventory.key?(target)
  end

  def inventory
    @game_text.inventory_list
    @game_text.inventory_error if @inventory.length == 0
    @inventory.each do |key, content|
      puts content.name + " - " + content.description
    end
    puts "---------"
    puts
  end

  def use(target)
    @inventory[target].execute_effect(self)
    if @inventory[target].deletable?
      @inventory.delete(target)
    end
  end

  ######################################
  # Battle
  ######################################
  def defeat
    puts "You were defeated."
  end

  def get_opponent
    @opponent
  end

  def escape
    puts eval("\"" + @dialog[:escape].split("\n").sample + "\"")
    insult(5)
  end

  def in_battle?
    @in_battle
  end

  def in_danger?
    @hp < 10 || @cp < 10
  end

  def opponent_name
    @opponent.name
  end

  def set_opponent(opponent)
    @opponent = opponent
  end

  def win
    puts "You won!"
  end
end
