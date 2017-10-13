class Player
  attr_accessor :hit_points, :morale
  attr_accessor :x_coord, :y_coord
  attr_accessor :in_battle

  MAX_HIT_POINTS = 100
  MAX_MORALE = 50

  def initialize
    @hit_points = 50
    @morale = MAX_MORALE
    @x_coord, @y_coord = 1, 0 # Start player in entrance
    @inventory = {}
    @game_text = GameText.new
    @in_battle = false
    @opponent = nil
    # @current_room = starting_room
  end

  def add_to_inventory(item)
    @inventory = @inventory.merge(item.set_target_data)
  end

  def inventory
    puts "The following items are in your inventory:"
    puts @game_text.error("ERROR: DANCEBOT_POCKETS.wmv RETURNED NULL VALUE") if @inventory.length == 0
    @inventory.each do |key, content|
      puts content.name
    end
  end

  def has_item?(target)
    @inventory.key?(target)
  end

  def use(target)
    @inventory[target].execute_effect(self)
    @inventory.delete(target)
  end

  def in_battle?
    @in_battle
  end

  def set_opponent(opponent)
    @opponent = opponent
  end

  def get_opponent
    @opponent
  end

  def alive?
    @hit_points > 0
  end

  def hurt(amount)
    @hit_points -= amount
  end

  def heal(amount)
    @hit_points += amount
    @hit_points = [@hit_points, MAX_HIT_POINTS].min
  end

  def current_status
    puts "HP: #{@hit_points}/#{MAX_HIT_POINTS}"
    puts "MP: #{@morale}/#{MAX_MORALE}"
  end
end
