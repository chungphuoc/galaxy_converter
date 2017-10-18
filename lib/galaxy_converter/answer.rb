require "galaxy_converter/calculator"
require "galaxy_converter/metal"

module GalaxyConverter
  class Answer
    UNKNOWN = "I have no idea what you are talking about"

    def initialize(question, calculator = Calculator, metal = Metal)
      @question = question
      @units = question.units
      @value = metal.new(question.value)
      @calculator = calculator.new(@units, @value)
    end

    def to_s
      return "" unless @question.mark?
      return UNKNOWN unless @question.valid?
      "#{stuff} #{value}"
    end

    private def compute
      "%g" % @calculator.call
    end

    private def stuff
      "#{@units} #{@value}".strip
    end

    private def value
      return "is #{compute}" if @value.nil?
      "is #{compute} Credits"
    end
  end
end
