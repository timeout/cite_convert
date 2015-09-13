require 'cite_convert/note'

module CiteConvert
  module Note
    module Apa
      class Year < Note
        def initialize(year)
          super(year)
        end

        def to_s
          "#{self.primary}"
        end
      end
    end
  end
end
