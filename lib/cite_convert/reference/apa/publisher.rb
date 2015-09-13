require 'cite_convert/reference/publisher'

module CiteConvert
  module Reference
    module Apa
      class Publisher < Publisher
        def initialize(publisher)
          super(publisher)
          @tokens = tokenize
          @tokens = downcase
          @tokens = shorten
          @tokens = capitalize
        end

        def to_s
          @tokens.join(' ')
        end

        private
        NOT_REQUIRED = [ 'publish', 'publica', 'company', 'limited', 
                         'incorporated' ]
        PREPOSITIONS = [ 'of' ]

        def tokenize
          self.publisher.to_s.split(' ')
        end

        def downcase
          @tokens.map { |token| token.downcase }
        end

        def shorten
          remove = @tokens.select do |token|
            NOT_REQUIRED.detect do |word|
              token =~ /#{word}/
            end
          end
          @tokens - remove
        end

        def capitalize
          @tokens.map do |token| 
            if PREPOSITIONS.include? token
              token
            else
              token.capitalize 
            end
          end
        end
      end
    end
  end
end
