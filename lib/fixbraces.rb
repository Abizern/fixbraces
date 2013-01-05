require "fixbraces/version"
require "tempfile"

module Fixbraces
  def Fixbraces.fixbraces(text)
    text_changed = false

    # Move the opening brace to the same line as the opening clause
    if text.gsub!(/\n[ \t]*\{[ \t]*$/, " {")
      text_changed = true
    end

    # If there are a pair of braces on their own line move them both up to the
    # same line as the opening line
    if text.gsub!(/\n[\s]*\{\}[\s]*$/, " {}")
      text_changed = true
    end

    text_changed ? text : nil
  end

  def Fixbraces.process_file(file)
    corrected_text = ""

    # Read in the text and pass it to the method that corrects it.
    File.open(file, "r") do |f|
      contents = f.read
      corrected_text = fixbraces contents
    end

    if corrected_text
      # Write the text to a temp file before overwriting the original file.
      temp_file = Tempfile.new "fixbraces"
      temp_file.write corrected_text
      temp_file.close

      FileUtils.cp temp_file.path, file
    end

    # Return the file path or nil if no changes were made
    corrected_text ? file : nil
  end

  def Fixbraces.dry_process_file(file)
    corrected_text = ""

    # Read in the text and pass it to the method that corrects it.
    File.open(file, "r") do |f|
      contents = f.read
      corrected_text = fixbraces contents
    end

    corrected_text ? file : nil
  end
end
