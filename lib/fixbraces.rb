require "fixbraces/version"
require "tempfile"

module Fixbraces
  def Fixbraces.fixbraces(text)
    # Move the opening brace to the same line as the opening clause
    partial_result = text.gsub(/\n[ \t]*\{[ \t]*$/, " {")

    # If there are a pair of braces on their own line move them both up to the
    # same line as the opening line
    partial_result.gsub(/\n[\s]*\{\}[\s]*$/, " {}")
  end

  def Fixbraces.process_file(file)
    temp_file = Tempfile.new "fixbraces"
    File.open(file, "r") do |f|
      contents = f.read
      new_contents = fixbraces contents
      temp_file.write new_contents
    end
    temp_file.close
    FileUtils.cp temp_file.path, file
    temp_file.unlink
  end
end
