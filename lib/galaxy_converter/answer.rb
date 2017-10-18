require "forwardable"
require "galaxy_converter/calculator"
require "galaxy_converter/question"

module GalaxyConverter
  class Answer
    extend Forwardable

    UNKNOWN = "I have no idea what you are talking about"

    def_delegators :@question, :units, :metal

    def initialize(question, calculator = Calculator)
      @question = question
      @calculator = calculator
    end

    def to_s
      return UNKNOWN unless @question.valid?
      "#{stuff} #{value}"
    end

    private def compute
      "%g" % @calculator.new(units, metal).call
    end

    private def stuff
      "#{units} #{metal.to_s.capitalize}".strip
    end

    private def value
      return "is #{compute}" unless metal
      "is #{compute} Credits"
    end
  end
end
