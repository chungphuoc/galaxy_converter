require "galaxy_converter/converter"
require "galaxy_converter/note"

module GalaxyConverter
  class Detector
    MAPPING_RULE = /(\w+) is (\w+)/
    GOODS_RULE = /([\w+\s]+) (\w+) is (\d+) credits/i

    attr_reader :converter

    def initialize(notes, converter = Converter)
      @credits, @assertions = notes.reject(&:question?).partition { |note| note.instance_of? Credit }
      @converter = converter.new(mapping)
    end

    def goods
      @goods ||= @credits.reduce({}) do |acc, note|
        matching = note.body.match(GOODS_RULE)
        next acc unless matching
        units, name, credits = matching.captures 
        value = @converter.call(units)
        next acc if value.zero?
        acc[name] = credits.to_f / value
        acc
      end
    end

    private def mapping
      @assertions.reduce({}) do |acc, note|
        matching = note.body.match(MAPPING_RULE)
        next acc unless matching
        unit, roman = matching.captures
        acc[unit.strip] = roman.upcase
        acc
      end
    end
  end
end
