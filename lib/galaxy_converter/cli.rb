require "galaxy_converter/answer"

module GalaxyConverter
  class CLI
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

    private def questions
      return [Question.new(@input)] unless file?
      data = File.readlines(@input).map(&:strip)
      Question::bulk(data)
    end

    private def answers
      questions.map { |question| Answer.new(question).to_s }.compact
    end
  end
end
