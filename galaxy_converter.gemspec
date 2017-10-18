# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "galaxy_converter/version"

Gem::Specification.new do |s|
  s.name = "galaxy_converter"
  s.version = GalaxyConverter::VERSION
  s.authors = ["costajob"]
  s.email = ["costajob@gmail.com"]
  s.summary = "Arabic numerals to galaxy units converter, aimed to help on intergalactic transactions."
  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|test|s|features)/}) }
  s.bindir = "bin"
  s.executables << "galaxy_converter"
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.2.2"

  s.add_development_dependency "bundler", "~> 1.15"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "minitest", "~> 5.0"
end
