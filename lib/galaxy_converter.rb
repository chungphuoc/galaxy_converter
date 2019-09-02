require "galaxy_converter/version"
require "galaxy_converter/responder"

module GalaxyConverter
  extend self

  def call(path_to_file)
    f = File.expand_path(path_to_file) 
    return unless File.exist?(f)
    notes = Note.from(File.readlines(f).map(&:strip))
    Responder.new(notes).call
  end
end
