class InputParser
  # Regex that represents words that should be filtered from user input
  FILTER_ARTICLES = Regexp.union(['a ', 'an ', 'the ', 'to ', 'go ', 'at '])

  # Attempt to interpret player's input as a command -> object concept
  #
  # ==== Returns
  # * {command: :symbol, target: :symbol} - hash in which we have identified the command the user
  # wants to execute on what world target. Target can be nil.
  def self.parse
    parsed = gets.chomp.downcase.gsub(FILTER_ARTICLES, '').split
    { command: (parsed[0].to_sym unless parsed[0].nil?), target: ( parsed[1].to_sym unless parsed[1].nil? ) }
  end
end
