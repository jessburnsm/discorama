class BattleExecutor
  SUCCESS_DIE = 20
  DAMAGE_DIE = 10
  RALLY_DIE = 4
  BONUS = 5

  def initialize(entity, opponent)
    @entity = entity
    @opponent = opponent
  end

  def dance
    if move_succeeds?(@entity.dance_skill, @opponent.dance_skill)
      @entity.dance_success
      @opponent.hurt(dance_damage_calculator)
      @entity.revert_dance_bonus
    else
      @entity.dance_failure
    end
  end

  def taunt
    if move_succeeds?(@entity.taunt_skill, @opponent.taunt_skill)
      @entity.taunt_success
      @opponent.insult(diceroll(DAMAGE_DIE) + @entity.taunt_bonus)
      @entity.revert_taunt_bonus
    else
      @entity.taunt_failure
    end
  end

  def rally
    if move_succeeds?(@entity.rally_skill, @opponent.rally_skill)
      @entity.rally_success
      case diceroll(RALLY_DIE)
      when 1
        @entity.apply_dance_bonus(BONUS)
      when 2
        @entity.apply_taunt_bonus(BONUS)
      when 3
        @entity.heal(diceroll(DAMAGE_DIE))
      when 4
        @entity.morale_boost(diceroll(DAMAGE_DIE))
      end
    else
      @entity.rally_failure
    end
  end

  private

  def dance_damage_calculator
    base_damage = diceroll(DAMAGE_DIE) + @entity.dance_bonus
    defense = (@opponent.cp * 0.1).floor
    total_damage = base_damage - defense
    return total_damage > 0 ? total_damage : 1
  end

  def diceroll(upper_limit)
    rand(1..upper_limit)
  end

  def move_succeeds?(entity_modifier, opponent_modifier)
    entity_roll = diceroll(SUCCESS_DIE) + entity_modifier
    opponent_roll = diceroll(SUCCESS_DIE) + opponent_modifier

    entity_roll > opponent_roll
  end
end
