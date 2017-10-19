require "galaxy_converter/rule"
require "galaxy_converter/unit"

module GalaxyConverter
  class Calculator
    def initialize(units, value = nil, rule = Rule)
      @units = rule.call(units) 
      @value = value
    end

    def call
      return total if @value.nil?
      @value * total
    end

    private def total
      Unit.bulk(@units).sum(&:to_i)
    end
  end
end
