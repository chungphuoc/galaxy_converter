require "galaxy_converter/roman_rule"

module GalaxyConverter
  module Roman
    module Numeral
      extend self

      SYMBOLS = {
        "M" => 1000,
        "D" => 500,
        "C" => 100,
        "L" => 50,
        "X" => 10,
        "V" => 5,
        "I" => 1
      }

      def to_i(roman)
        Rule.new(roman).to_additive.chars.sum do |symbol|
          SYMBOLS.fetch(symbol, 0)
        end
      end

      def to_roman(number)
       roman = ""
       SYMBOLS.reduce(number) do |to_convert, (symbol, arabic)|
         repetitions, remainder = to_convert.divmod(arabic)
         roman << symbol * repetitions
         remainder
       end
       Rule.new(roman).to_subtractive
      end
    end
  end
end
