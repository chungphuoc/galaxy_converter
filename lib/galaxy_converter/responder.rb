require "forwardable"
require "galaxy_converter/recognizer"

module GalaxyConverter
  class Responder
    extend Forwardable

    def_delegators :@recognizer, :metals, :abacus

    UNKNOWN_ANSWER = "I have no idea what you are talking about"

    def initialize(notes, recognizer = Recognizer, abacus = Abacus)
      @notes = notes
      @recognizer = recognizer.new(@notes, abacus)
    end

    def call
      @notes.reduce([]) do |acc, note|
        next acc unless note.question?
        units, metal = detect(note)
        total = value(units, metal)
        acc << to_s(units, metal, total, note.commercial?)
        acc
      end
    end 

    private def to_s(units, metal, total, commercial)
      return UNKNOWN_ANSWER if total.zero?
      [].tap do |s|
        s << units
        s << metal.to_s.capitalize
        s << "is"
        s << "%g" % total
        s << "Credits" if commercial
      end.reject(&:empty?).join(" ")
    end

    private def value(units, metal)
      units_value = abacus.call(units)
      metal_value = metals.fetch(metal, 1)
      units_value * metal_value
    end

    private def detect(note)
      tokens = note.stripped.split
      return [tokens.join(" "), nil] unless note.commercial?
      metal = tokens.pop
      [tokens.join(" "), metal]
    end
  end
end
