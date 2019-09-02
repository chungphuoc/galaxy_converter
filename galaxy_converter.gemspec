# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "galaxy_converter/version"

Gem::Specification.new do |s|
  s.name = "galaxy_converter"
  s.version = GalaxyConverter::VERSION
  s.authors = ["costajob"]
  s.email = ["costajob@gmail.com"]
  s.homepage = "https://github.com/costajob/galaxy_converter"
  s.license = "MIT"
  s.summary = "Implementation of the Merchant's Guide to the Galaxy kata"
  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir = "bin"
  s.executables << "galaxy_converter"
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.4.1"
  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 12.3"
  s.add_development_dependency "minitest", "~> 5.11"
end
