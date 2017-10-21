require "galaxy_converter/responder"

module GalaxyConverter
  class CLI
    HELP_FLAGS = %w[-h --help]
    COL_WIDTH = 23

    def initialize(input, pipe = STDOUT, responder = Responder)
      @input = input
      @pipe = pipe
      @responder = responder
    end

    def call
      @pipe.puts output
    end

    private def output
      return help if help?
      return unless file?
      data = File.readlines(@input).map(&:strip)
      notes = Note.bulk(data)
      @responder.new(notes).call
    end

    private def file?
      File.file?(File.expand_path(@input))
    end

    private def help?
      HELP_FLAGS.include?(@input)
    end

    private def help
      [].tap do |h|
        h << %q{Usage: galaxy_converter <input>}
        h << "    %-#{COL_WIDTH}s Print this help" % "-h --help"
        h << "    %-#{COL_WIDTH}s Load conversion notes" % "~/notes.txt"
      end
    end
  end
end
