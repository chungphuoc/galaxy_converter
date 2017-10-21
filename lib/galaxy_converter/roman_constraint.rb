module GalaxyConverter
  module Roman
    class Constraint
      def initialize(roman)
        @roman = roman
      end

      def violated?
        (repetitions + subtractions).any? do |constraint|
          @roman.index(constraint)
        end
      end

      private def repetitions
        %w[I X C M].map { |c| c * 4 } +
        %w[D L V].map { |c| c * 2 }
      end

      private def subtractions
        %w[V X].map { |c| "II#{c}"} +
        %w[L C].map { |c| "XX#{c}"} +
        %w[D M].map { |c| "CC#{c}"} +
        %w[L C D M].map { |c| "I#{c}" } +
        %w[D M].map { |c| "X#{c}" } +
        %w[X L C D M].map { |c| "V#{c}" } + 
        %w[C D M].map { |c| "L#{c}"} +
        ["DM"]
      end
    end
  end
end
