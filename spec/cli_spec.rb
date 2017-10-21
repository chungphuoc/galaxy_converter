require "helper"

describe GalaxyConverter::CLI do
  let(:output) { StringIO.new }

  it "must print help" do
    cli = GalaxyConverter::CLI.new("-h", output)
    cli.call
    output.string.must_equal "Usage: galaxy_converter <input>\n    -h --help               Print this help\n    ~/notes.txt             Load conversion notes\n"
  end

  it "must print answers" do
    cli = GalaxyConverter::CLI.new(Stubs.notes_file.path, output)
    cli.call
    output.string.must_equal "pish tegj glob glob is 42\nglob prok Silver is 68 Credits\nglob prok Gold is 57800 Credits\nglob prok Iron is 782 Credits\nI have no idea what you are talking about\n"
  end
end
