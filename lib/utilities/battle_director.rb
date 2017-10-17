# Responsible for executing dance battle actions
class BattleDirector
  def initialize(player)
    @player = player
    @opponent = player.get_opponent
    @game_text = GameText.new
  end

  def execute_opponent_turn
    @opponent.battle
  end

  def call(action)
    begin
      system "clear"
      BattleCommand.get_command(action[:command]).execute(@player, @opponent)
    rescue BattleCommandNotFound => message
      @game_text.command_error(message)
    end
  end
end
