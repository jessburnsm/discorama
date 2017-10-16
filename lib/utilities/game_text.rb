# Handles responsibility for formatting + output of general game text
class GameText
  require 'yaml'
  require 'colorize'

  def initialize
    @text = YAML.load_file('dialog/game_text.yml')
    @player = @text[:name]
  end

  ######################################
  # String output functions
  ######################################
  def output(text)
    print process(text)
  end

  def process(text)
    eval("\"" + text + "\"")
  end

  ######################################
  # String formatting functions
  ######################################
  def delimiter
    output(@text[:delimiter])
  end

  def discorama
    process(@text[:discorama])
  end

  def emphasis(string)
    string.upcase.yellow
  end

  def error(string)
    string.red
  end

  def highlight(string)
    string.blue
  end

  def information(string)
    string.green
  end

  def warning(string)
    string.yellow
  end

  ######################################
  # Error functions
  ######################################
  def battle_error(target = '')
    puts error(eval("\"" + @text[:battle_error] + "\""))
  end

  def command_error(command)
    puts error(eval("\"" + @text[:command_error] + "\""))
  end

  def item_error(item = '')
    puts error(eval("\"" + @text[:item_error] + "\""))
  end

  def map_error
    output(@text[:path_error].red)
  end

  def target_error(target = '')
    puts error(eval("\"" + @text[:target_error] + "\""))
  end

  ######################################
  # Game functions
  ######################################
  def action_prompt
    output(information(@text[:prompt]))
  end

  def battle_prompt
    output(@text[:battle_prompt].green)
  end

  def current_status(current_room)
    puts current_room
    current_room.content.each do |key, content|
      puts content
    end
  end

  def exit
    output(information(@text[:exit]))
  end

  ######################################
  # Other
  ######################################
  def help
    output(@text[:help])
  end
  
  def intro
    system "clear"
    output(information(@text[:game_prompt]))
    gets
    output(@text[:game_intro])
    load 'portraits/discorama.rb'
    output(information(@text[:game_start]))
    gets
    system "clear"
  end
end
