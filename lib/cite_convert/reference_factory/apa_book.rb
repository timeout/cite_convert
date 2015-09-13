require 'cite_convert/reference/apa/book'
require 'cite_convert/reference/apa/author'
require 'cite_convert/reference/apa/editor'
require 'cite_convert/reference/apa/editor_in_collection'
require 'cite_convert/reference/apa/publication_date'
require 'cite_convert/reference/apa/address'
require 'cite_convert/reference/apa/publisher'
require 'cite_convert/reference/apa/edition'
require 'cite_convert/reference/apa/title'

module CiteConvert
  module ReferenceFactory
    module ApaBook
      def self.make_reference(reference)
        book = Reference::Apa::Book.new(reference.index)

        # authors
        reference.authors.each do |author|
          book.add_author(
            CiteConvert::Reference::Apa::Author.new(author.surname, author.given_names))
        end

        # editors
        reference.editors.each do |editor|
          book.add_editor(
            CiteConvert::Reference::Apa::Editor.new(editor.surname, editor.given_names))
        end if reference.authors.empty?


        # editor in collection
        reference.editors.each do |editor|
          book.add_editor_in_collection(
            CiteConvert::Reference::Apa::EditorInCollection.new(editor.surname, editor.given_names))
        end unless reference.authors.empty?

        # publication_date
        book.publication_date=CiteConvert::Reference::Apa::PublicationDate.new(
          reference.publication_date.year, reference.publication_date.month,
          reference.publication_date.day)

        # title
        book.title = reference.title
        # book.title = CiteConvert::Reference::Apa::Title.new(reference.title)

        # selection
        book.selection = reference.selection

        # address
        book.address = CiteConvert::Reference::Apa::Address.new(
          reference.address.city, reference.address.state)

        # publisher
        book.publisher = CiteConvert::Reference::Apa::Publisher.new(reference.publisher)

        # edition
        if reference.edition
          book.edition = CiteConvert::Reference::Apa::Edition.new(reference.edition.edition)
        end

        # organisation
        book.organisation = reference.organisation

        # pages
        book.pages = reference.pages

        book
      end
    end
  end
end

