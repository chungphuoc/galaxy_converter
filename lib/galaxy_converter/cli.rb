require "galaxy_converter/answer"
require "galaxy_converter/question"

module GalaxyConverter
  class CLI
    HELP_FLAGS = %w[-h --help]
    COL_WIDTH = 23

    def initialize(input, io = STDOUT)
      @input = input
      @io = io
    end

    def call
      @io.puts output
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
        h << "    %-#{COL_WIDTH}s Answer the question" % %q{"how much is pish?"}
        h << "    %-#{COL_WIDTH}s Load questions file" % "~/questions.txt"
      end
    end

    private def questions
      return [Question.new(@input)] unless file?
      data = File.readlines(@input).map(&:strip)
      Question::bulk(data)
    end

    private def output
      return help if help?
      questions.map { |question| Answer.new(question).to_s }.reject(&:empty?)
    end
  end
end
