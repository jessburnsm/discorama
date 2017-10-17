class Player
  attr_accessor :x_coord, :y_coord, :in_battle, :dance_skill, :taunt_skill, :rally_skill

  MAX_HP = 100
  MAX_CP = 50

  DEFAULT_DANCE_SKILL = 0
  DEFAULT_TAUNT_SKILL = 0
  DEFAULT_RALLY_SKILL = 0

  def initialize
    @game_text = GameText.new

    # Starting position
    @x_coord, @y_coord = 1, 0

    # Starting stats
    @hp = MAX_HP
    @cp = MAX_CP
    @dance_skill = DEFAULT_DANCE_SKILL
    @taunt_skill = DEFAULT_TAUNT_SKILL
    @rally_skill = DEFAULT_RALLY_SKILL

    # Battle variables
    @in_battle = false
    @opponent = nil

    @inventory = {}
  end

  def current_status
    puts
    puts @game_text.information(@game_text.player + " SYSTEM STATUS")
    puts @game_text.warning("WARNING: CRITICAL DANCE FAILURE IMMINENT.") if in_danger?
    puts "HP: #{@hp}/#{MAX_HP}"
    puts "CP: #{@cp}/#{MAX_CP}"
    puts "DANCE LVL: #{@dance_skill}"
    puts "TAUNT LVL: #{@taunt_skill}"
    puts "RALLY LVL: #{@rally_skill}"
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
      puts content.name
    end
  end

  def use(target)
    @inventory[target].execute_effect(self)
    @inventory.delete(target)
  end

  ######################################
  # Battle
  ######################################
  def alive?
    @hp > 0 && @cp > 0
  end

  def get_opponent
    @opponent
  end

  def heal(amount)
    @hp += amount
    @hp = [@hp, MAX_HP].min
  end

  def hurt(amount)
    @hp -= amount
  end

  def in_battle?
    @in_battle
  end

  def in_danger?
    @hp < 10 || @cp < 10
  end

  def set_opponent(opponent)
    @opponent = opponent
  end
end
