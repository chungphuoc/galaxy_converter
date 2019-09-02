require "forwardable"
require "galaxy_converter/detector"

module GalaxyConverter
  class Responder
    extend Forwardable

    def_delegators :@detector, :goods, :converter

    def initialize(notes, detector = Detector)
      @questions = notes.select(&:question?)
      @detector = detector.new(notes)
    end

    def call
      @questions.reduce([]) do |acc, note|
        total = total(note)
        acc << note.answer(total)
      end
    end 

    private def total(note)
      converter.call(note.units) * goods.fetch(note.good, 1)
    end
  end
end
