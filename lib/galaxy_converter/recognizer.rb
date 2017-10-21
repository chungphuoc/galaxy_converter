require "galaxy_converter/abacus"
require "galaxy_converter/note"

module GalaxyConverter
  class Recognizer
    MATCHING_RULE = /(\w+) is (\w+)/

    attr_reader :abacus

    def initialize(notes, abacus = Abacus)
      notes = notes.reject(&:question?)
      @commercials, @assertions = notes.partition(&:commercial?)
      @abacus = abacus.new(mapping)
    end

    def metals
      @metals ||= @commercials.reduce({}) do |acc, note|
        stripped = strip_units(note)
        matching = stripped.match(MATCHING_RULE)
        next acc unless matching
        name, credits = matching.captures 
        units = note.body.sub(stripped, "").strip
        acc[name] = credits.to_f / @abacus.call(units)
        acc
      end
    end

    private def strip_units(note)
      note.body.gsub(/#{mapping.keys.join("|")}/, "").strip
    end

    private def mapping
      @mapping ||= @assertions.reduce({}) do |acc, note|
        matching = note.body.match(MATCHING_RULE)
        next acc unless matching
        unit, roman = matching.captures
        acc[unit.strip] = roman.upcase
        acc
      end
    end
  end
end
