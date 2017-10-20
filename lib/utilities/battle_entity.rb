# Holds all common functionality for entities that do battle
module BattleEntity
  def alive?
    @hp > 0
  end

  def apply_dance_bonus(bonus)
    @dance_bonus = bonus
    puts "A bonus modifier has been applied to #{name}'s dance skill!"
  end

  def apply_taunt_bonus(bonus)
    @taunt_bonus = bonus
    puts "A bonus modifier has been applied to #{name}'s taunt skill!"
  end

  def current_cp
    "CP: #{@cp}/#{self.class::MAX_CP}"
  end

  def current_hp
    "HP: #{@hp}/#{self.class::MAX_HP}"
  end

  def heal(amount)
    @hp += amount
    @hp = [@hp, self.class::MAX_HP].min
    puts "#{name} has gained #{amount} HP!"
  end

  def hurt(amount)
    @hp -= amount
    puts "#{name} was wounded and lost #{amount} HP!"
  end

  def insult(amount)
    @cp -= amount
    @cp = [@cp, 0].max
    puts "#{name} has lost #{amount} CP!"
  end

  def morale_boost(amount)
    @cp += amount
    @cp = [@cp, self.class::MAX_CP].min
    puts "#{name} has gained #{amount} CP!"
  end

  def revert_dance_bonus
    @dance_bonus = 0
  end

  def revert_taunt_bonus
    @taunt_bonus = 0
  end

  ######################################
  # Battle dialog
  ######################################
  def dance_failure
    puts eval("\"" + @dialog[:dance_failure].split("\n").sample + "\"")
    puts "#{opponent_name} takes no damage from the feeble dance attempt!"
  end

  def dance_success
    puts eval("\"" + @dialog[:dance_success].split("\n").sample + "\"")
  end

  def rally_success
    puts eval("\"" + @dialog[:rally_success].split("\n").sample + "\"")
  end

  def rally_failure
    puts eval("\"" + @dialog[:rally_failure].split("\n").sample + "\"")
  end

  def taunt_failure
    puts eval("\"" + @dialog[:taunt_failure].split("\n").sample + "\"")
    puts "#{opponent_name} takes no CP loss from that lame diss!"
  end

  def taunt_success
    puts eval("\"" + @dialog[:taunt_success].split("\n").sample + "\"")
  end
end
