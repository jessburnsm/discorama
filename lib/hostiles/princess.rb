require_relative './hostile'

class Princess < Hostile
  MAX_HP = 10
  MAX_CP = 50
  DANCE_SKILL = 1
  TAUNT_SKILL = 3
  RALLY_SKILL = 1

  def set_name
    "Princess"
  end

  def set_dialog
    YAML.load_file('dialog/hostiles/princess.yml')
  end

  def set_portrait
    #File.open('portraits/jerry.txt').read
  end
end
