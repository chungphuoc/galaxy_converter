require "galaxy_converter/roman_numeral"

module GalaxyConverter
  class Converter
    def initialize(mapping = {}, unit = RomanNumeral)
      @mapping = mapping
      @unit = unit
    end

    def call(units)
      converted = convert(units)
      @unit.new(converted).to_i
    end

    private def convert(units)
      units.split(" ").reduce("") do |acc, unit|
        acc << @mapping.fetch(unit, "")
      end
    end
  end
end
