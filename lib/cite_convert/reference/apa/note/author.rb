require 'cite_convert/reference/apa/author'

module CiteConvert
  module Reference
    module Apa
      module Note
        class Author < Author
          def initialize(author)
            super(author.surname, author.given_names)
          end

          def to_s
            self.surname
          end
        end
      end
    end
  end
end
