require 'cite_convert/reference/apa/author'
require 'cite_convert/reference/apa/authors'
require 'cite_convert/reference/apa/publication_date'
require 'cite_convert/reference/title'

module CiteConvert
  module Reference
    module Apa
      class Apa
        def initialize(index)
          @index = index
          @authors = Authors.new
        end

        attr_reader :index, :authors, :publication_date, :title

        def add_author(author)
          @authors << author
        end

        def authors?
          not self.authors.empty?
        end

        def authors_note
          self.authors.note if self.authors?
        end

        def authors_text
          self.authors.text if self.authors?
        end

        def authors_initialed_note
          self.authors.initialed_note
        end

        def authors_initialed_text
          self.authors.initialed_text
        end

        def publication_date= (publication_date)
          @publication_date = publication_date
        end

        def title= (title)
          @title = title
        end
      end
    end
  end
end

