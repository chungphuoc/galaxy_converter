module GalaxyConverter
  class Question
    PREFIXES = ["how much is ", "how many credits is "]
    MARK = "?"

    def self.bulk(questions)
      Array(questions).map do |body|
        new(body)
      end
    end

    def initialize(body)
      @body = body.downcase
    end

    def valid?
      PREFIXES.any? { |prefix| @body.start_with?(prefix) } && mark?
    end

    def mark?
      @body.end_with?(MARK)
    end

    def units
      return stripped if @body.start_with?(PREFIXES.first)
      tokens.first(tokens.size - 1).join(" ")
    end

    def metal
      return unless @body.start_with?(PREFIXES.last)
      tokens.last
    end

    private def stripped
      @body.sub(/#{PREFIXES.join("|")}/, "").sub(MARK, "").strip
    end

    private def tokens
      @tokens ||= stripped.split(" ")
    end
  end
end
