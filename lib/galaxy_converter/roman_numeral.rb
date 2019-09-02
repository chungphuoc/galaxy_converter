require "galaxy_converter/constraint"
require "galaxy_converter/stretcher"

module GalaxyConverter
  class RomanNumeral
    SYMBOLS = {
      "M" => 1000,
      "D" => 500,
      "C" => 100,
      "L" => 50,
      "X" => 10,
      "V" => 5,
      "I" => 1
    }

    def initialize(value, constraint = Constraint, stretcher = Stretcher)
      @value = value.to_s.upcase
      @constraint = constraint
      @stretcher = stretcher
    end

    def to_s
      @value
    end

    def to_i
      return 0 unless valid?
      @stretcher.call(@value).chars.sum { |symbol| SYMBOLS.fetch(symbol, 0) }
    end

    private def valid?
      !@constraint.call(@value)
    end
  end
end
