require 'cite_convert/reference/persons'

module CiteConvert
  class Editors < Persons
      alias_method :editors, :persons

      def to_s
        if self.size == 1
          "#{self.editors.first}"
        else
          "#{self.editors[0...-1].join(', ')} and #{self.editors.last}"
        end
      end
  end
end

