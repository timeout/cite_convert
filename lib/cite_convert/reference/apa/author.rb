require 'cite_convert/reference/author'
require 'cite_convert/reference/apa/note/author'
require 'cite_convert/reference/apa/note/author_initialed'

module CiteConvert
  module Reference
    module Apa
      class Author < Author
        def initialize(surname, given_names)
          super(surname, given_names)
        end

        def note
          "#{Note::Author.new(self)}"
        end

        def initialed_note
          "#{Note::AuthorInitialed.new(self)}"
        end

        def to_s
          "#{self.surname}, #{self.initials}"
        end
      end
    end
  end
end
