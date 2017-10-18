require "galaxy_converter/metal"
require "galaxy_converter/rule"
require "galaxy_converter/unit"

module GalaxyConverter
  class Calculator
    def initialize(units, metal, rule = Rule)
      @units = units
      @metal = Metal.new(metal)
      @rule = rule
    end

    def call
      @metal * total_units
    end

    private def total_units
      Unit.bulk(additive).reduce(0) do |total, unit|
        total += unit.to_i
      end
    end

    private def additive
      @rule.call(@units) 
    end
  end
end
