require 'cite_convert/reference/apa/book'
require 'cite_convert/reference'
require 'cite_convert/reference/author'
require 'cite_convert/reference/apa/author'
require 'cite_convert/reference/publication_date'
require 'cite_convert/reference/apa/publication_date'
require 'cite_convert/reference/address'
require 'cite_convert/reference/apa/address'
require 'cite_convert/reference/publisher'
require 'cite_convert/reference/apa/publisher'

RSpec.describe CiteConvert::Reference::Apa::Book do
  describe '#initialize' do
    it 'constructs an apa reference for a book' do
      CiteConvert::Reference::Apa::Book.new(1)
    end
  end

  describe 'basic format' do
    it 'creates a book reference for a single author' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_author(CiteConvert::Reference::Author.new('Chessick', 'Richard D.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007'))
      reference.title=('The Future of Psychoanalysis')
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('State University of New York Press')

      book = CiteConvert::Reference::Apa::Book.new(1)
      reference.authors.each do |author|
        book.add_author(
          CiteConvert::Reference::Apa::Author.new(author.surname, author.given_names))
      end
      book.publication_date=CiteConvert::Reference::Apa::PublicationDate.new(
        reference.publication_date.year, reference.publication_date.month,
        reference.publication_date.day)
      book.title = reference.title
      book.address = CiteConvert::Reference::Apa::Address.new(
        reference.address.city, reference.address.state)
      book.publisher = CiteConvert::Reference::Apa::Publisher.new(reference.publisher)

      puts book.to_s
    end

    it 'creates a book reference for two or more authors' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_author(CiteConvert::Reference::Author.new('Wright', 'John Paul'))
      reference.add_author(CiteConvert::Reference::Author.new('Tibbetts', 'Stephen G.'))
      reference.add_author(CiteConvert::Reference::Author.new('Daigle', 'Leah E.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2008'))
      reference.title=('Criminals in the making: Criminality across the life course')
      reference.address=(CiteConvert::Reference::Address.new('Thousand Oaks', 'California'))
      reference.publisher=('Sage Publications')

      book = CiteConvert::Reference::Apa::Book.new(1)
      reference.authors.each do |author|
        book.add_author(
          CiteConvert::Reference::Apa::Author.new(author.surname, author.given_names))
      end
      book.publication_date=CiteConvert::Reference::Apa::PublicationDate.new(
        reference.publication_date.year, reference.publication_date.month,
        reference.publication_date.day)
      book.title = reference.title
      book.address = CiteConvert::Reference::Apa::Address.new(
        reference.address.city, reference.address.state)
      book.publisher = CiteConvert::Reference::Apa::Publisher.new(reference.publisher)

      puts book.to_s
    end
  end
end
