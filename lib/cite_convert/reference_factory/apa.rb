require 'cite_convert/reference_factory/apa_periodical'
require 'cite_convert/reference_factory/apa_book'

module CiteConvert
  module ReferenceFactory
    module Apa
      def self.make_reference(reference)
        if reference.format == "journal"
            CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
        elsif reference.format == "book"
            CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
        else
          raise Error.new("Unknown publication type: #{ref.publication_type}")
        end
      end
    end
  end
end
