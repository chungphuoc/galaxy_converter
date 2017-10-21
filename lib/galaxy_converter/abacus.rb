require "galaxy_converter/roman_numeral"

module GalaxyConverter
  class Abacus
    def initialize(mapping = {}, converter = Roman::Numeral)
      @mapping = mapping
      @converter = converter
    end

    def call(units)
      converted = convert(units)
      result = @converter.new(converted)
      return 0 unless result.valid?
      result.to_i
    end

    private def convert(units)
      units.split(" ").reduce("") do |to_convert, unit|
        to_convert << @mapping[unit].to_s
      end
    end
  end
end
