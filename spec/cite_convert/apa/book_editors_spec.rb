require 'cite_convert/reference/apa/book'
require 'cite_convert/reference'
require 'cite_convert/reference/apa/publication_date'
require 'cite_convert/reference/apa/address'
require 'cite_convert/reference/apa/publisher'
require 'cite_convert/reference/apa/edition'
require 'cite_convert/reference/editor'
require 'cite_convert/reference/apa/editor'
require 'cite_convert/reference/apa/editor_in_collection'
require 'cite_convert/reference/author'
require 'cite_convert/reference/apa/author'
require 'cite_convert/reference/selection'
require 'cite_convert/reference/pages'

RSpec.describe CiteConvert::Reference::Apa::Book do
  describe 'a book with no author named' do
    it 'creates an apa reference of an edited collection' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_editor(CiteConvert::Reference::Editor.new('Foreman', 'Marquis D.'))
      reference.add_editor(CiteConvert::Reference::Editor.new('Milisen', 'Koen'))
      reference.add_editor(CiteConvert::Reference::Editor.new('Fulner', 'Terry T.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2010'))
      reference.title='Critical care nursing of older adults: Best Practices'
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('Springer')

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
      expect(book.to_s).to eq('Foreman, M. D., Milisen, K., & Fulner, T. T. (Eds.). (2010). Critical care nursing of older adults: Best Practices. New York, NY: Springer.')
      puts book.to_s

    end

    it 'creates an apa reference of a selected work in a collection' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_author(CiteConvert::Reference::Author.new('Estrin', 'Miriam'))
      reference.add_author(CiteConvert::Reference::Author.new('Malm', 'Carl'))
      reference.add_editor(CiteConvert::Reference::Editor.new('Rice', 'Susan E.'))
      reference.add_editor(CiteConvert::Reference::Editor.new('Graff', 'Corinne'))
      reference.add_editor(CiteConvert::Reference::Editor.new('Pascul', 'Carlos'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2010'))
      reference.selection='State weakness and infectious diseases'
      reference.title='Confronting poverty: Weak states and U.S. national security'
      reference.pages=(CiteConvert::Reference::Pages.new('167', '201'))
      reference.address=(CiteConvert::Reference::Address.new('Washington', 'DC'))
      reference.publisher=('Brookings Institution Press')

      book = CiteConvert::Reference::Apa::Book.new(1)
      reference.authors.each do |author|
        book.add_author(
          CiteConvert::Reference::Apa::Author.new(author.surname, author.given_names))
      end
      reference.editors.each do |editor|
        book.add_editor_in_collection(
          CiteConvert::Reference::Apa::EditorInCollection.new(editor.surname, editor.given_names))
      end
      book.publication_date=CiteConvert::Reference::Apa::PublicationDate.new(
        reference.publication_date.year, reference.publication_date.month,
        reference.publication_date.day)
      book.selection = reference.selection
      book.title = reference.title
      book.address = CiteConvert::Reference::Apa::Address.new(
        reference.address.city, reference.address.state)
      book.publisher = CiteConvert::Reference::Apa::Publisher.new(reference.publisher)
      book.pages = reference.pages
      expect(book.to_s).to eq('Estrin, M., & Malm, C. (2010). State weakness and infectious diseases. In S. E. Rice, C. Graff & C. Pascul (Eds.), Confronting poverty: Weak states and U.S. national security (pp. 167-201). Washington, DC: Brookings Institution Press.')
      puts book.to_s
    end
  end
end
