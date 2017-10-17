class BattleExecutor
  SUCCESS_DIE = 20
  DAMAGE_DIE = 10
  RALLY_DIE = 4

  def initialize(entity, opponent)
    @entity = entity
    @opponent = opponent
  end

  def dance
    if move_succeeds?(@entity.dance_skill, @opponent.dance_skill)
      @opponent.hurt(diceroll(DAMAGE_DIE))
    else
      puts "Dance was not successful."
    end
  end

  def taunt
    if move_succeeds?(@entity.taunt_skill, @opponent.taunt_skill)
      @opponent.insult(diceroll(DAMAGE_DIE))
    else
      puts "Taunt was not successful."
    end
  end

  def rally
    if move_succeeds?(@entity.rally_skill, @opponent.rally_skill)
      case diceroll(RALLY_DIE)
      when 1
        puts "Dance boost"
      when 2
        puts "Taunt boost"
      when 3
        @entity.heal(diceroll(DAMAGE_DIE))
      when 4
        @entity.morale_boost(diceroll(DAMAGE_DIE))
      end
    else
      puts "Rally was not successful"
    end
  end

  private

  def diceroll(upper_limit)
    rand(1..upper_limit)
  end

  def move_succeeds?(entity_modifier, opponent_modifier)
    entity_roll = diceroll(SUCCESS_DIE) + entity_modifier
    opponent_roll = diceroll(SUCCESS_DIE) + opponent_modifier

    entity_roll > opponent_roll
  end
end
