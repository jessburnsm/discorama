# Responsible for executing dance battle actions
class BattleDirector
  def initialize(player)
    @player = player
    @opponent = player.get_opponent
    @game_text = GameText.new
  end

  def execute_opponent_turn
    @opponent.battle
    battle_status
  end

  def call(action)
    begin
      system "clear"
      BattleCommand.get_command(action[:command]).execute(@player, @opponent)
    rescue BattleCommandNotFound => message
      @game_text.command_error(message)
    end
  end

  def battle_status
    puts
    puts "#{@player.name}\t\t#{@opponent.name}"
    puts "#{@player.current_hp}\t\t#{@opponent.current_hp}"
    puts "#{@player.current_cp}\t\t#{@opponent.current_cp}"
    puts "DANCE LVL: #{@player.dance_skill}" + (@player.dance_bonus > 0 ? @game_text.information(" + #{@player.dance_bonus}") : "")
    puts "TAUNT LVL: #{@player.taunt_skill}" + (@player.taunt_bonus > 0 ? @game_text.information(" + #{@player.taunt_bonus}") : "")
    puts "RALLY LVL: #{@player.rally_skill}"
  end
end
