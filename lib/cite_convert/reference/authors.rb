require 'cite_convert/reference/persons'

module CiteConvert
  module Reference
    class Authors < Persons
      alias_method :authors, :persons

      def to_s
        if self.size == 1
          "#{self.authors.first}"
        else
          "#{self.authors[0...-1].join(', ')} and #{self.authors.last}"
        end
      end
    end
  end
end

