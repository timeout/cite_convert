require 'cite_convert/reference/editor'

module CiteConvert
  module Reference
    module Apa
      class EditorInCollection < Editor
        def initialize(surname, given_names)
          super(surname, given_names)
        end

        def to_s
          "#{self.initials} #{self.surname}"
        end
      end
    end
  end
end

