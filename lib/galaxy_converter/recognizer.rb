require "galaxy_converter/abacus"
require "galaxy_converter/note"

module GalaxyConverter
  class Recognizer
    attr_reader :abacus

    def initialize(notes, abacus = Abacus)
      notes = notes.reject(&:question?)
      @commercials, @assertions = notes.partition(&:commercial?)
      @abacus = abacus.new(mapping)
    end

    def goods
      @goods ||= @commercials.reduce({}) do |acc, note|
        matching = note.body.match(goods_rule)
        next acc unless matching
        units, name, credits = matching.captures 
        value = @abacus.call(units)
        next acc if value.zero?
        acc[name] = credits.to_f / value
        acc
      end
    end

    private def goods_rule
      /([#{mapping.keys.join("|")}\s]+) (\w+) is (\d+)/
    end

    private def mapping
      @mapping ||= @assertions.reduce({}) do |acc, note|
        matching = note.body.match(mapping_rule)
        next acc unless matching
        unit, roman = matching.captures
        acc[unit.strip] = roman.upcase
        acc
      end
    end

    private def mapping_rule
      /(\w+) is (\w)/
    end
  end
end
