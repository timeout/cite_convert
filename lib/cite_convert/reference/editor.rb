require 'cite_convert/reference/person'

module CiteConvert
  module Reference
    class Editor < Person
      def initialize(surname, given_names)
        super(surname, given_names)
      end
    end
  end
end
