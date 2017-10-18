require "galaxy_converter/rule"
require "galaxy_converter/unit"

module GalaxyConverter
  class Calculator
    def initialize(units, value = nil, rule = Rule)
      @units = units
      @value = value
      @rule = rule
    end

    def call
      return total unless @value
      @value * total
    end

    private def total
      Unit.bulk(additive).reduce(0) do |total, unit|
        total += unit.to_i
      end
    end

    private def additive
      @rule.call(@units) 
    end
  end
end
