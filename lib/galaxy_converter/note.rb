module GalaxyConverter
  class Note
    PREFIXES = ["how much is", "how many credits is"]
    QUESTION_MARK = "?"

    def self.bulk(notes)
      Array(notes).map { |body| new(body) }
    end

    attr_reader :body

    def initialize(body)
      @body = body.to_s.strip.downcase
    end

    def question?
      @body.end_with?(QUESTION_MARK)
    end

    def commercial?
      !!@body.index("credits")
    end

    def stripped
      @body.sub(/#{PREFIXES.join("|")}/, "").sub(QUESTION_MARK, "").strip
    end
  end
end
