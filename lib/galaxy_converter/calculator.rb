require "galaxy_converter/metal"
require "galaxy_converter/rule"
require "galaxy_converter/unit"

module GalaxyConverter
  class Calculator
    def initialize(units, metal = nil, rule = Rule)
      @units = units
      @metal = metal
      @rule = rule
    end

    def call
      return total unless @metal
      Metal.new(@metal) * total
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
