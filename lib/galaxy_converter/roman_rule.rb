module GalaxyConverter
  module Roman
    class Rule
      LONG_TO_SHORT = {
        "DCCCC" => "CM", # 900
        "CCCC"  => "CD", # 400
        "LXXXX" => "XC", # 90
        "XXXX"  => "XL", # 40
        "VIIII" => "IX", # 9
        "IIII"  => "IV"  # 4
      }

      def initialize(value)
        @value = value
      end

      def to_additive
        convert(LONG_TO_SHORT.invert)
      end

      def to_subtractive
        convert(LONG_TO_SHORT)
      end

      private def convert(map)
        map.reduce(@value) do |to_convert, (form_1, form_2)|
          to_convert.gsub(form_1, form_2)
        end
      end
    end
  end
end
