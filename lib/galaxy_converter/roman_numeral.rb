require "galaxy_converter/constraint"

module GalaxyConverter
  class RomanNumeral
    SYMBOLS = {
      "M" => 1000,
      "D" => 500,
      "C" => 100,
      "L" => 50,
      "X" => 10,
      "V" => 5,
      "I" => 1
    }

    STRETCH_MAP = {
      "DCCCC" => "CM", # 900
      "CCCC"  => "CD", # 400
      "LXXXX" => "XC", # 90
      "XXXX"  => "XL", # 40
      "VIIII" => "IX", # 9
      "IIII"  => "IV"  # 4
    }

    def initialize(value, constraint = Constraint)
      @value = value.to_s.upcase
      @constraint = constraint
    end

    def to_i
      return 0 if @constraint.call(@value)
      to_l.chars.sum { |symbol| SYMBOLS.fetch(symbol, 0) }
    end

    private def to_l
      STRETCH_MAP.reduce(@value) do |value, (long, short)|
        value.gsub(short, long)
      end
    end
  end
end
