module GalaxyConverter
  class Rule
    LONG_TO_SHORT = {
      "pish pish pish pish"  => "pish tegj",
      "prok glob glob glob glob" => "glob pish",
      "glob glob glob glob"  => "glob prok"
    }

    def initialize(units)
      @units = units
    end

    def subtractive
      convert(LONG_TO_SHORT)
    end

    def additive
      convert(LONG_TO_SHORT.invert)
    end

    private def convert(map)
      map.reduce(@units) do |converted, (long_form, short_form)|
        converted.gsub(/#{long_form}/, short_form)
      end
    end
  end
end
