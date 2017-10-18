require "helper"

describe GalaxyConverter::CLI do
  let(:output) { StringIO.new }

  it "must print help" do
    cli = GalaxyConverter::CLI.new("-h", output)
    cli.call
    output.string.must_equal "Usage: galaxy_converter <input>\n    -h --help               Print this help\n    \"how much is pish?\"     Answer the question\n    ~/questions.txt         Load questions file\n"
  end

  it "must print single answer" do
    cli = GalaxyConverter::CLI.new("how much is pish tegj glob glob ?", output)
    cli.call
    output.string.must_equal "pish tegj glob glob is 42\n"
  end

  it "must print multiple answers" do
    input = Tempfile.new(["notebook", ".txt"]).tap do |f|
      f.puts "glob is I"
      f.puts "prok is V"
      f.puts "pish is X"
      f.puts "tegj is L"
      f.puts "glob glob Silver is 34 Credits"
      f.puts "glob prok Gold is 57800 Credits"
      f.puts "pish pish Iron is 3910 Credits"
      f.puts "how much is pish tegj glob glob ?"
      f.puts "how many Credits is glob prok Silver ?"
      f.puts "how many Credits is glob prok Gold ?"
      f.puts "how many Credits is glob prok Iron ?"
      f.puts "how much wood could a woodchuck chuck if a woodchuck could chuck wood ?"
      f.rewind
    end

    cli = GalaxyConverter::CLI.new(input.path, output)
    cli.call
    output.string.must_equal "pish tegj glob glob is 42\nglob prok Silver is 68 Credits\nglob prok Gold is 57800 Credits\nglob prok Iron is 782 Credits\nI have no idea what you are talking about\n"
  end
end
