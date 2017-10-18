module GalaxyConverter
  module Rule
    extend self

    LONG_TO_SHORT = {
      "pish pish pish pish"  => "pish tegj",
      "prok glob glob glob glob" => "glob pish",
      "glob glob glob glob"  => "glob prok"
    }

    def call(units)
      LONG_TO_SHORT.reduce(units) do |converted, (long_form, short_form)|
        converted.gsub(/#{short_form}/, long_form)
      end
    end
  end
end
