require "galaxy_converter/abacus"
require "galaxy_converter/note"

module GalaxyConverter
  class Recognizer
    attr_reader :abacus

    def initialize(notes, 
                   abacus = Abacus,
                   symbols = Roman::Numeral::SYMBOLS.keys)
      @assertions = notes.reject(&:question?)
      @symbols = symbols.map(&:downcase)
      @abacus = abacus.new(mapping)
    end

    def metals
      @metals ||= @assertions.select(&:commercial?).reduce({}) do |acc, note|
        stripped = note.body.gsub(/#{mapping.keys.join("|")}/, "").strip
        matching = stripped.match(/(\w+) is (\d+) credits/)
        next acc unless matching
        units = note.body.split(stripped).first.strip
        units_value = @abacus.call(units)
        name, credits = matching.captures 
        acc[name] = credits.to_f / units_value
        acc
      end
    end

    private def mapping
      @mapping ||= @assertions.reduce({}) do |acc, note|
        matching = note.body.match(/(\w+) is (#{@symbols.join("|")})/)
        next acc unless matching
        unit, roman = matching.captures
        acc[unit.strip] = roman.upcase
        acc
      end
    end
  end
end
