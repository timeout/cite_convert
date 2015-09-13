require 'cite_convert/reference/editors'

module CiteConvert
  module Reference
    module Apa
      class Editors < Editors
        def to_s
          if self.size == 1
            "#{self.editors.first} (Ed.)."
          else
            "#{self.editors[0...-1].join(', ')}, & #{self.editors.last} (Eds.)."
          end
        end
      end
    end
  end
end
