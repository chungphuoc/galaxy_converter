module GalaxyConverter
  module Constraint
    extend self

    def call(value)
      violations.any? { |violation| value.index(violation) }
    end

    private def violations
      @violations ||= too_many_repetitions + unrepeatable + repeated_sub + wrong_sub
    end

    private def too_many_repetitions
      %w[I X C M].map { |c| c * 4 }
    end

    private def unrepeatable
      %w[D L V].map { |c| c * 2 }
    end

    private def repeated_sub
      %w[V X].map { |c| "II#{c}"} +
        %w[L C].map { |c| "XX#{c}"} +
        %w[D M].map { |c| "CC#{c}"}
    end 

    private def wrong_sub
      %w[L C D M].map { |c| "I#{c}" } +
        %w[D M].map { |c| "X#{c}" } +
        %w[X L C D M].map { |c| "V#{c}" } + 
        %w[C D M].map { |c| "L#{c}"} +
        %w[M].map { |c| "D#{c}" }
    end
  end
end
