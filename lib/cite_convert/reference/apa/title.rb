require 'cite_convert/reference/title'

module CiteConvert
  module Reference
    module Apa
      class Title < Title
        include Comparable

        def initialize(title)
          super(title)
          @title = remove_subtitle(title) if title.include? (':')
          @tokens = tokenize
        end

        attr_reader :title

        def <=>(other)
          self.to_s <=> other.to_s
        end

        def to_s
          @tokens = remove_articles
          @tokens = remove_first if unimportant_first?
          @tokens = shorten if shorten?
          @tokens = capitalize
          stringify
        end

        private
        PREPOSITIONS = ['of', 'with', 'by', 'into', 'from', 'at', 'as', 'to', 'into']
        CONJUNCTIONS = ['or', 'and', 'nor', 'but', 'so']
        ARTICLES = ['a', 'an', 'the']

        def remove_subtitle(title)
          @title = title[0...title.index(':')]
        end

        def tokenize
          @tokens = self.title.downcase.split(' ')
        end

        def remove_articles
          @tokens - ARTICLES
        end

        def unimportant_first?
          first_word = @tokens.first
          PREPOSITIONS.include?(first_word) or CONJUNCTIONS.include?(first_word)
        end

        def remove_first
          @tokens.drop(1)
        end

        def capitalize
          @tokens.map do |token| 
            if PREPOSITIONS.include?(token) or CONJUNCTIONS.include?(token)
              token
            else
              token.capitalize
            end
          end
        end

        def shorten?
          @tokens.size > 2
        end

        def shorten
          (has_apostrophe? or has_conjunction? or has_preposition?) ? @tokens.take(3) : @tokens.take(2)
        end

        def has_apostrophe?
          second_word.include?("'")
        end

        def has_conjunction?
          CONJUNCTIONS.include?(second_word)
        end

        def has_preposition?
          PREPOSITIONS.include?(second_word)
        end

        def stringify
          @tokens.join(' ')
        end

        def second_word
          @tokens[1]
        end
      end
    end
  end
end
