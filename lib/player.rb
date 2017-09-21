class Player
  attr_accessor :hit_points, :morale
  attr_accessor :x_coord, :y_coord

  MAX_HIT_POINTS = 100
  MAX_MORALE = 50

  def initialize
    @hit_points = 50
    @morale = MAX_MORALE
    @x_coord, @y_coord = 1, 0 # Start player in entrance
    @inventory = {}
    @game_text = GameText.new
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
    puts "*" * 80
    puts "HP: #{@hit_points}/#{MAX_HIT_POINTS}"
    puts "SP: #{@morale}/#{MAX_MORALE}"
    puts "*" * 80
  end
end
