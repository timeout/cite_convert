require 'cite_convert/reference/apa/book'
require 'cite_convert/reference'
require 'cite_convert/reference/apa/publication_date'
require 'cite_convert/reference/apa/address'
require 'cite_convert/reference/apa/publisher'
require 'cite_convert/reference/apa/edition'
require 'cite_convert/reference/editor'
require 'cite_convert/reference/apa/editor'

RSpec.describe CiteConvert::Reference::Apa::Book do
  describe 'a book with no author named' do
    it 'creates an apa reference' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2004'))
      reference.title='United Press International stylebook and guide to newswriting'
      reference.edition='4'
      reference.address=(CiteConvert::Reference::Address.new('Herndon', 'Virginia'))
      reference.publisher=('Capital Books Incorporated')

      book = CiteConvert::Reference::Apa::Book.new(1)
      book.publication_date=CiteConvert::Reference::Apa::PublicationDate.new(
        reference.publication_date.year, reference.publication_date.month,
        reference.publication_date.day)
      book.title = reference.title
      book.edition = CiteConvert::Reference::Apa::Edition.new(reference.edition.edition)
      book.address = CiteConvert::Reference::Apa::Address.new(
        reference.address.city, reference.address.state)
      book.publisher = CiteConvert::Reference::Apa::Publisher.new(reference.publisher)

      puts book.to_s
    end

    it 'creates an apa reference' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_editor(CiteConvert::Reference::Editor.new('VandenBos', 'Gary R.'))
      reference.publication_date=CiteConvert::Reference::PublicationDate.new('2007')
      reference.title='APA dictionary of psychology'
      reference.address=(CiteConvert::Reference::Address.new('Washington', 'DC'))
      reference.publisher=('American Psychological Association')

      book = CiteConvert::Reference::Apa::Book.new(1)
      reference.editors.each do |editor|
        book.add_editor(
          CiteConvert::Reference::Apa::Editor.new(editor.surname, editor.given_names))
      end
      book.publication_date=CiteConvert::Reference::Apa::PublicationDate.new(
        reference.publication_date.year, reference.publication_date.month,
        reference.publication_date.day)
      book.title = reference.title
      book.address = CiteConvert::Reference::Apa::Address.new(
        reference.address.city, reference.address.state)
      book.publisher = CiteConvert::Reference::Apa::Publisher.new(reference.publisher)

      puts book.to_s
      expect(book.to_s).to eq('VandenBos, G. R. (Ed.). (2007). APA dictionary of psychology. Washington, DC: American Psychological Association.')
    end

    it 'creates an apa reference' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.organisation = 'American Psychological Association'
      reference.publication_date=CiteConvert::Reference::PublicationDate.new('2009')
      reference.title='Publication Manual of the American Psychological Association'
      reference.edition='6'
      reference.address=(CiteConvert::Reference::Address.new('Washington', 'DC'))
      reference.publisher=('American Psychological Association')

      book = CiteConvert::Reference::Apa::Book.new(1)
      book.publication_date=CiteConvert::Reference::Apa::PublicationDate.new(
        reference.publication_date.year, reference.publication_date.month,
        reference.publication_date.day)
      book.organisation = reference.organisation
      book.title = reference.title
      book.edition = CiteConvert::Reference::Apa::Edition.new(reference.edition.edition)
      book.address = CiteConvert::Reference::Apa::Address.new(
        reference.address.city, reference.address.state)
      book.publisher = CiteConvert::Reference::Apa::Publisher.new(reference.publisher)

      puts book.to_s
      expect(book.to_s).to eq('American Psychological Association. (2009). Publication Manual of the American Psychological Association (6th ed.). Washington, DC: Author.')
    end

    it 'creates an apa reference' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.organisation = 'American Medical Association'
      reference.publication_date=CiteConvert::Reference::PublicationDate.new('2007')
      reference.title='American Medical Association manual of style: A guide to authors and editors'
      reference.edition='10'
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('Oxford University Press')

      book = CiteConvert::Reference::Apa::Book.new(1)
      book.publication_date=CiteConvert::Reference::Apa::PublicationDate.new(
        reference.publication_date.year, reference.publication_date.month,
        reference.publication_date.day)
      book.organisation = reference.organisation
      book.title = reference.title
      book.edition = CiteConvert::Reference::Apa::Edition.new(reference.edition.edition)
      book.address = CiteConvert::Reference::Apa::Address.new(
        reference.address.city, reference.address.state)
      book.publisher = CiteConvert::Reference::Apa::Publisher.new(reference.publisher)

      puts book.to_s
      expect(book.to_s).to eq('American Medical Association. (2007). American Medical Association manual of style: A guide to authors and editors (10th ed.). New York, NY: Oxford University Press.')
    end
  end
end
