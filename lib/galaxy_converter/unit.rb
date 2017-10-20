module GalaxyConverter
  class Unit
    SYMBOLS = {
      "tegj" => 50,
      "pish" => 10,
      "prok" => 5,
      "glob" => 1
    }

    def self.bulk(units)
      units.split(" ").map { |name| new(name) }
    end

    def initialize(name)
      @name = name
    end

    def to_i
      SYMBOLS.fetch(@name, 0)
    end
  end
end
