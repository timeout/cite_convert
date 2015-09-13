module CiteConvert
  module Reference
    class Organisation
      def initialize(organisation)
        @organisation = organisation
        @tokens = tokenize
        @tokens = remove_articles
        @tokens = remove_prepositions
        @tokens = remove_conjunctions
      end

      attr_reader :organisation

      def abbrev
        @tokens.map do |token|
          token[0].upcase
        end.join
      end

      def note_s
        if @cited.nil?
          @cited = true
          "#{organisation} [#{self.abbrev}]"
        else
          "#{self.abbrev}"
        end
      end

      def to_s
        "#{organisation}"
      end

      private
      PREPOSITIONS = ['of', 'with', 'by', 'into', 'from', 'at', 'as', 
                      'to', 'into', 'for']
      CONJUNCTIONS = ['or', 'and', 'nor', 'but', 'so']
      ARTICLES = ['a', 'an', 'the']

      def tokenize
        @organisation.downcase.split(' ')
      end

      def remove_articles
        @tokens - ARTICLES
      end

      def remove_prepositions
        @tokens - PREPOSITIONS
      end

      def remove_conjunctions
        @tokens - CONJUNCTIONS
      end
    end
  end
end
