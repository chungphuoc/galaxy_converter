module GalaxyConverter
  class Metal
    METAL_VALUES = {
      "silver" => 17,
      "iron" => 195.5, 
      "gold" => 14450
    }

    def initialize(name)
      @name = name.downcase
    end

    def credits
      METAL_VALUES.fetch(@name, 0)
    end

    def *(n)
      n.to_i * credits
    end
  end
end
