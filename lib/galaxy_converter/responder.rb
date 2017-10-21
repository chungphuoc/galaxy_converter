require "forwardable"
require "galaxy_converter/recognizer"

module GalaxyConverter
  class Responder
    extend Forwardable

    def_delegators :@recognizer, :metals, :abacus

    UNKNOWN_ANSWER = "I have no idea what you are talking about"

    def initialize(notes, recognizer = Recognizer, abacus = Abacus)
      @questions = notes.select(&:question?)
      @recognizer = recognizer.new(notes, abacus)
    end

    def call
      @questions.reduce([]) do |acc, note|
        units, metal = detect(note)
        total = total(units, metal)
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

    private def total(units, metal)
      return abacus.call(units) unless metal
      abacus.call(units) * metals.fetch(metal, 0)
    end

    private def detect(note)
      tokens = note.stripped.split
      return [tokens.join(" "), nil] unless note.commercial?
      metal = tokens.pop
      [tokens.join(" "), metal]
    end
  end
end
