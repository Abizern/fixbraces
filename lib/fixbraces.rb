require "fixbraces/version"

module Fixbraces
  def Fixbraces.fixbraces(text)
    # Move the opening brace to the same line as the opening clause
    text.gsub(/\n[ \t]*\{[ \t]*$/, " {")
  end
end
