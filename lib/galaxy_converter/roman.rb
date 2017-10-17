module Roman
  class Converter
    NUMERALS_TO_SYMBOLS = {
      1000 => "M",
      500 => "D",
      100 => "C",
      50 => "L",
      10 => "X",
      5 => "V",
      1 => "I" 
    }
    SYMBOLS_TO_NUMERALS = NUMERALS_TO_SYMBOLS.invert

    def to_r(number)
      result = ""
      NUMERALS_TO_SYMBOLS.reduce(number.to_i) do |to_be_converted, (num, symbol)|
        num_chars_needed, remainder = to_be_converted.divmod(num)
        result << symbol * num_chars_needed
        remainder
      end
      Rule.new(result).to_short
    end

    def to_i(roman)
      Rule.new(roman).to_long.chars.reduce(0) do |total, roman_letter|
        total += SYMBOLS_TO_NUMERALS[roman_letter]
      end
    end
  end

  class Rule
    LONG_TO_SHORT_MAP = {
      "DCCCC" => "CM",
      "CCCC"  => "CD",
      "LXXXX" => "XC",
      "XXXX"  => "XL",
      "VIIII" => "IX",
      "IIII"  => "IV"
    }

    def initialize(roman)
      @roman = roman
    end

    def to_short
      convert(LONG_TO_SHORT_MAP)
    end

    def to_long
      convert(LONG_TO_SHORT_MAP.invert)
    end

    private def convert(map)
      map.reduce(@roman) do |converted_roman, (long_form, short_form)|
        converted_roman.gsub(/#{long_form}/, short_form)
      end
    end
  end
end
