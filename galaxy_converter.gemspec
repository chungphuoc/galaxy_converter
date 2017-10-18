# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "galaxy_converter/version"

Gem::Specification.new do |s|
  s.name = "galaxy_converter"
  s.version = GalaxyConverter::VERSION
  s.authors = ["costajob"]
  s.email = ["costajob@gmail.com"]
  s.homepage = "https://bitbucket.org/costajob/galaxy_converter"
  s.license = "MIT"
  s.summary = "Arabic numerals to galaxy units converter, aimed to help on intergalactic transactions."
  s.files = %w(README.md Rakefile galaxy_converter.gemspec Gemfile Gemfile.lock bin/galaxy_converter) + Dir["{spec,lib}/**/*.{rb,RB}"]
  s.bindir = "bin"
  s.executables << "galaxy_converter"
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.2.2"

  s.add_development_dependency "bundler", "~> 1.15"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "minitest", "~> 5.0"
end
