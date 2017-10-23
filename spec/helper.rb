$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "benchmark/ips"
require "galaxy_converter"
require "minitest/autorun"
require "tempfile"
require "stubs"
