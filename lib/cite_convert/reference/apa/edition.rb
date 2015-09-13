require 'cite_convert/reference/edition'

module CiteConvert
  module Reference
    module Apa
      class Edition < Edition
        def initialize(edition)
          super(edition)
        end

        def to_s
          case self.edition
          when 1
            # warning
          when 2
            "#{self.edition}nd ed."
          when 3
            "#{self.edition}rd ed."
          else
            "#{self.edition}th ed."
          end
        end
      end
    end
  end
end
