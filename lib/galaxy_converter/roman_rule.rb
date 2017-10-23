module GalaxyConverter
  module Roman
    module Rule
      extend self

      LONG_TO_SHORT = {
        "DCCCC" => "CM", # 900
        "CCCC"  => "CD", # 400
        "LXXXX" => "XC", # 90
        "XXXX"  => "XL", # 40
        "VIIII" => "IX", # 9
        "IIII"  => "IV"  # 4
      }

      def call(value)
        LONG_TO_SHORT.reduce(value) do |to_convert, (long, short)|
          to_convert.gsub(short, long)
        end
      end
    end
  end
end
