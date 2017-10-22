require "galaxy_converter/roman_numeral"

module GalaxyConverter
  class Abacus
    def initialize(mapping = {}, unit = Roman::Numeral)
      @mapping = mapping
      @unit = unit
    end

    def call(units)
      converted = convert(units)
      result = @unit.new(converted)
      return 0 unless result.valid?
      result.to_i
    end

    private def convert(units)
      units.split(" ").reduce("") do |to_convert, unit|
        return unless @mapping[unit]
        to_convert << @mapping[unit]
      end
    end
  end
end
