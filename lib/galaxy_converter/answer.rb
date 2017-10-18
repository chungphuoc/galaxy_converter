require "galaxy_converter/calculator"
require "galaxy_converter/question"

module GalaxyConverter
  class Answer
    UNKNOWN = "I have no idea what you are talking about"

    def initialize(question, calculator = Calculator)
      @question = question
      @units = question.units
      @metal = question.metal
      @calculator = calculator
    end

    def to_s
      return UNKNOWN unless @question.valid?
      "#{stuff} #{value}"
    end

    private def compute
      "%g" % @calculator.new(@units, @metal).call
    end

    private def stuff
      "#{@units} #{@metal.to_s.capitalize}".strip
    end

    private def value
      return "is #{compute}" unless @metal
      "is #{compute} Credits"
    end
  end
end
