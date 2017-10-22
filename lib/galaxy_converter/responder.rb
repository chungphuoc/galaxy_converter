require "forwardable"
require "galaxy_converter/recognizer"

module GalaxyConverter
  class Responder
    extend Forwardable

    def_delegators :@recognizer, :goods, :abacus

    UNKNOWN_ANSWER = "I have no idea what you are talking about"

    def initialize(notes, recognizer = Recognizer, abacus = Abacus)
      @questions = notes.select(&:question?)
      @recognizer = recognizer.new(notes, abacus)
    end

    def call
      @questions.reduce([]) do |acc, note|
        units, good = detect(note)
        total = total(units, good)
        acc << to_s(units, good, total, note.commercial?)
        acc
      end
    end 

    private def to_s(units, good, total, commercial)
      return UNKNOWN_ANSWER if total.zero?
      [].tap do |s|
        s << units
        s << good.to_s.capitalize
        s << "is"
        s << "%g" % total
        s << "Credits" if commercial
      end.reject(&:empty?).join(" ")
    end

    private def total(units, good)
      return abacus.call(units) unless good
      abacus.call(units) * goods.fetch(good, 0)
    end

    private def detect(note)
      tokens = note.stripped.split
      return [tokens.join(" "), nil] unless note.commercial?
      good = tokens.pop
      [tokens.join(" "), good]
    end
  end
end
