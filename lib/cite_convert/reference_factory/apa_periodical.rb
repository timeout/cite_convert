require 'cite_convert/reference/apa/periodical'

module CiteConvert
  module ReferenceFactory
    module ApaPeriodical
      def self.make_reference(reference)
        periodical = Reference::Apa::Periodical.new(reference.index)

        # authors
        reference.authors.each do |author|
          periodical.add_author(
            Reference::Apa::Author.new(author.surname, author.given_names))
        end

        # publication date
        periodical.publication_date = CiteConvert::Reference::Apa::PublicationDate.new(
          reference.publication_date.year, 
          reference.publication_date.month, 
          reference.publication_date.day)

        # article title
        periodical.article_title = reference.article_title

        # (journal) title
        periodical.title = reference.title
        # periodical.title = CiteConvert::Reference::Apa::Title.new(reference.title)

        # volume
        periodical.volume = reference.volume

        # issue
        periodical.issue = reference.issue

        # pages
        periodical.pages = reference.pages

        periodical
      end
    end
  end
end
