require 'cite_convert/reference/publication_date'

module CiteConvert
  module Reference
    module Apa
      class PublicationDate < PublicationDate
        def initialize(year, month = nil, day = nil)
          super(year, month, day)
        end

        def ==(other)
          self.to_date == other.to_date
        end

        def to_s
          date = self.to_date
          if self.day? and self.month?
            "#{date.strftime("%Y, %B %-d")}" 
          elsif self.month?
            "#{date.strftime("%Y, %B")}" 
          else
            "#{date.strftime("%Y")}"
          end
        end
      end
    end
  end
end
