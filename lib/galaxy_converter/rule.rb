module GalaxyConverter
  module Rule
    extend self

    LONG_TO_SHORT = {
      "pish pish pish pish"  => "pish tegj",     # 40
      "prok glob glob glob glob" => "glob pish", # 9
      "glob glob glob glob"  => "glob prok"      # 4
    }

    def call(units)
      LONG_TO_SHORT.reduce(units) do |converted, (long_form, short_form)|
        converted.gsub(/#{short_form}/, long_form)
      end
    end
  end
end
