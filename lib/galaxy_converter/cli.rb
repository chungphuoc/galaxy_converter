require "galaxy_converter/answer"

module GalaxyConverter
  class CLI
    HELP_FLAGS = %w[-h --help]
    COL_WIDTH = 23

    def initialize(input, output = STDOUT)
      @input = input
      @output = output
    end

    def puts
      @output.puts answers
    end

    private def file?
      File.exist?(File.expand_path(@input))
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

    private def answers
      return help if help?
      questions.map { |question| Answer.new(question).to_s }.compact
    end
  end
end
