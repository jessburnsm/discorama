class Player
  attr_accessor :x_coord, :y_coord, :in_battle,
    :dance_skill, :taunt_skill, :rally_skill, :taunt_bonus, :dance_bonus

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
  end

  def current_status
    puts
    puts @game_text.information(@game_text.player + " SYSTEM STATUS")
    puts @game_text.warning("WARNING: CRITICAL DANCE FAILURE IMMINENT.") if in_danger?
    puts "HP: #{@hp}/#{MAX_HP}"
    puts "CP: #{@cp}/#{MAX_CP}"
    puts "DANCE LVL: #{@dance_skill}" + (@dance_bonus > 0 ? @game_text.information(" + #{@dance_bonus}") : "")
    puts "TAUNT LVL: #{@taunt_skill}" + (@taunt_bonus > 0 ? @game_text.information(" + #{@taunt_bonus}") : "")
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
    puts "DANCEBOT_9000 has gained #{amount} hp!"
  end

  def hurt(amount)
    @hp -= amount
    puts "DANCEBOT_9000 was wounded"
  end

  def insult(amount)
    @cp -= amount
    puts "#{name} spirit was broken and took #{amount} reputation damage."
  end

  def in_battle?
    @in_battle
  end

  def in_danger?
    @hp < 10 || @cp < 10
  end

  def morale_boost(amount)
    @cp += amount
    @cp = [@cp, MAX_CP].min
    puts "DANCEBOT_9000 has gained #{amount} cp!"
  end

  def set_opponent(opponent)
    @opponent = opponent
  end
end
