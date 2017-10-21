module Stubs
  extend self

  NOTES = [
    "glob is I",
    "prok is V",
    "pish is X",
    "tegj is L",
    "glob glob Silver is 34 Credits",
    "glob prok Gold is 57800 Credits",
    "pish pish Iron is 3910 Credits",
    "how much is pish tegj glob glob ?",
    "how many Credits is glob prok Silver ?",
    "how many Credits is glob prok Gold ?",
    "how many Credits is glob prok Iron ?",
    "how much wood could a woodchuck chuck if a woodchuck could chuck wood ? " ]

  def notes_file
    Tempfile.new(["notes", ".txt"]).tap do |f|
      NOTES.each { |note| f.puts note }
      f.rewind
    end
  end
end
