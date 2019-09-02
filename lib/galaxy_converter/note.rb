module GalaxyConverter
  class Note
    PREFIXES = ["how much is", "how many credits is"]
    QUESTION = "?"
    NO_IDEA = "I have no idea what you are talking about"

    def self.from(notes)
      Array(notes).map { |body| new(body) }
    end

    attr_reader :body, :units, :good

    def initialize(body)
      @body = body.to_s.strip.downcase
      @units, @good = detect
    end

    def question?
      @body.end_with?(QUESTION)
    end

    def commercial?
      !!@body.index("credits")
    end

    def answer(total = 0)
      return NO_IDEA if total.zero?
      [].tap do |s|
        s << units
        s << good.to_s.capitalize
        s << "is"
        s << "%g" % total
        s << "Credits" if commercial?
      end.reject(&:empty?).join(" ")
    end

    private def detect
      tokens = stripped.split
      return [tokens.join(" "), nil] unless commercial?
      good = tokens.pop
      [tokens.join(" "), good]
    end

    private def stripped
      @body.sub(/#{PREFIXES.join("|")}/, "").sub(QUESTION, "").strip
    end
  end
end
