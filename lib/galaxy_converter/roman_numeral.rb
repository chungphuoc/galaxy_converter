require "galaxy_converter/roman_constraint"
require "galaxy_converter/roman_rule"

module GalaxyConverter
  module Roman
    class Numeral
      SYMBOLS = {
        "M" => 1000,
        "D" => 500,
        "C" => 100,
        "L" => 50,
        "X" => 10,
        "V" => 5,
        "I" => 1
      }

      def initialize(value, constraint = Constraint, rule = Rule)
        @value = value.to_s.upcase
        @constraint = constraint
        @rule = rule
      end

      def to_s
        @value
      end

      def to_i
        @rule.call(@value).chars.reduce(0) do |total, symbol|
          total += SYMBOLS.fetch(symbol, 0)
        end
      end

      def valid?
        return false if @value.empty?
        !@constraint.violated?(@value)
      end
    end
  end
end
