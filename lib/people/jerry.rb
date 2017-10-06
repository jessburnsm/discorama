require_relative './person'

class Jerry < Person
  def set_name
    "Jerry"
  end

  def set_dialog
    YAML.load_file('dialog/jerry.yml')
  end

  def set_portrait
    File.open('portraits/jerry.txt').read
  end
end
