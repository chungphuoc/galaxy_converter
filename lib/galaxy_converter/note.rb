module GalaxyConverter
  class Note
    PREFIXES = ["how much is", "how many credits is"]
    QUESTION = "?"
    NO_IDEA = "I have no idea what you are talking about"
    CREDITS = "credits"

    def self.from(notes)
      Array(notes).map do |body| 
        klass = body.index(/#{CREDITS}/i) ? Credit : Note
        klass.new(body)
      end
    end

    attr_reader :body, :units, :good

    def initialize(body)
      @body = body.to_s.strip.downcase
      @units, @good = detect
    end

    def question?
      @body.end_with?(QUESTION)
    end

    def answer(total = 0)
      return NO_IDEA if total.zero?
      [].tap do |s|
        s << units
        s << good.to_s.capitalize
        s << "is"
        s << "%g" % total
      end.reject(&:empty?).join(" ")
    end

    private def detect
      return stripped, nil
    end

    private def stripped
      @body.sub(/#{PREFIXES.join("|")}/, "").sub(QUESTION, "").strip
    end
  end

  class Credit < Note
    def answer(total = 0)
      super << " #{CREDITS.capitalize}"
    end

    private def detect
      tokens = stripped.split
      good = tokens.pop
      [tokens.join(" "), good]
    end
  end
end
