require "galaxy_converter/version"
require "galaxy_converter/cli"

module GalaxyConverter
  extend self

  def call(notes)
    notes = Note.bulk(notes)
    Responder.new(notes).call
  end
end
