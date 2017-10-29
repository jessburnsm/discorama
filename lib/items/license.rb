require_relative './item'

class License < Item
  def set_name
    "license"
  end

  def deletable?
    false
  end

  def set_dialog
    YAML.load_file('dialog/items/license.yml')
  end
end
