require 'cite_convert/note'

module CiteConvert
  module Note
    module Apa
      class AuthorYear < Note
        def initialize(year, author)
          super(year, author)
        end

        def to_s
          "#{self.secondary}, #{self.primary}"
        end
      end
    end
  end
end
