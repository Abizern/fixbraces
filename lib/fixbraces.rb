require "fixbraces/version"

module Fixbraces
  def Fixbraces.fixbraces(text)
    # Move the opening brace to the same line as the opening clause
    partial_result = text.gsub(/\n[ \t]*\{[ \t]*$/, " {")

    # If there are a pair of braces on their own line move them both up to the
    # same line as the opening line
    partial_result.gsub(/\n[ \t]*\{\}[ \t]*$/, " {}")
  end
end
