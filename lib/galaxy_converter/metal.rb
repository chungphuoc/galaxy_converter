module GalaxyConverter
  class Metal
    VALUES = {
      "silver" => 17,
      "iron" => 195.5, 
      "gold" => 14450
    }

    def initialize(name)
      @name = name.to_s.downcase
    end

    def credits
      VALUES.fetch(@name, 0)
    end

    def to_s
      @name.capitalize
    end

    def *(n)
      n.to_i * credits
    end
  end
end
