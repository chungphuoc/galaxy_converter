require "galaxy_converter/note"
require "galaxy_converter/responder"

module GalaxyConverter
  class CLI
    HELP_FLAGS = %w[-h --help]
    COL_WIDTH = 23

    def initialize(input, 
                   pipe = STDOUT, 
                   responder = Responder,
                   note = Note)
      @input = input
      @pipe = pipe
      @responder = responder
      @note = note
    end

    def call
      @pipe.puts output
    end

    private def output
      return help if help?
      return unless file?
      data = File.readlines(@input).map(&:strip)
      notes = @note.bulk(data)
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
        h << %q{Usage: galaxy_converter ~/notes.txt}
        h << "    %-#{COL_WIDTH}s Print this help" % "-h --help"
        h << "    %-#{COL_WIDTH}s Load conversion notes" % "<path-to-file>"
      end
    end
  end
end
