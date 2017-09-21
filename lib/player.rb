class Player
  attr_accessor :hit_points, :attack_power
  attr_accessor :x_coord, :y_coord

  MAX_HIT_POINTS = 100

  def initialize
    @hit_points        = MAX_HIT_POINTS
    @attack_power      = 1
    @x_coord, @y_coord = 1, 0 # Start player in entrance
    @inventory = {}
    # @current_room = starting_room
  end

  def add_to_inventory(item)
    @inventory = @inventory.merge(item.set_target_data)
  end

  def inventory
    puts "The following items are in your inventory:"
    @inventory.each do |key, content|
      puts content.name
    end
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

  def print_status
    puts "*" * 80
    puts "HP: #{@hit_points}/#{MAX_HIT_POINTS}"
    puts "AP: #{@attack_power}"
    puts "*" * 80
  end
end
