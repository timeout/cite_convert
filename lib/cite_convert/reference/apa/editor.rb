require 'cite_convert/reference/editor'

module CiteConvert
  module Reference
    module Apa
      class Editor < Editor
        def initialize(surname, given_names)
          super(surname, given_names)
        end

        def to_s
          "#{self.surname}, #{self.initials}"
        end
      end
    end
  end
end
