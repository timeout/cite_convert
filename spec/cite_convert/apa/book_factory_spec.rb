require 'cite_convert/reference_factory/apa_book'
require 'cite_convert/reference'

RSpec.describe CiteConvert::ReferenceFactory::ApaBook do
  # basic book
  describe '#make_reference' do
    it 'creates a book reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.add_author(CiteConvert::Reference::Author.new('Chessick', 'Richard D.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007'))
      reference.title=('The Future of Psychoanalysis')
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('State University of New York Press')

      book_ref = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
      puts "#{book_ref}"
      expect(book_ref.to_s).to eq("Chessick, R. D. (2007). The Future of Psychoanalysis. New York, NY: State University of New York Press.")
    end

    it 'creates a book reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.add_author(CiteConvert::Reference::Author.new('Wright', 'John Paul'))
      reference.add_author(CiteConvert::Reference::Author.new('Tibbetts', 'Stephen G.'))
      reference.add_author(CiteConvert::Reference::Author.new('Daigle', 'Leah E.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2008'))
      reference.title=('Criminals in the making: Criminality across the life course')
      reference.address=(CiteConvert::Reference::Address.new('Thousand Oaks', 'California'))
      reference.publisher=('Sage Publications')

      book_ref = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
      puts "#{book_ref}"
      expect(book_ref.to_s).to eq("Wright, J. P., Tibbetts, S. G., & Daigle, L. E. (2008). Criminals in the making: Criminality across the life course. Thousand Oaks, CA: Sage.")
    end

    it 'creates a book reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.add_author(CiteConvert::Reference::Author.new('Lazarus', 'Richard S.'))
      reference.add_author(CiteConvert::Reference::Author.new('Lazarus', 'Bernice N.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2006'))
      reference.title=('Coping with aging')
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('Oxford University Press')
      
      book_ref = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
      puts "#{book_ref}"
      expect(book_ref.to_s).to eq("Lazarus, R. S., & Lazarus, B. N. (2006). Coping with aging. New York, NY: Oxford University Press.")
    end

    # book editors
    it 'creates a book reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.add_editor(CiteConvert::Reference::Editor.new('Foreman', 'Marquis D.'))
      reference.add_editor(CiteConvert::Reference::Editor.new('Milisen', 'Koen'))
      reference.add_editor(CiteConvert::Reference::Editor.new('Fulner', 'Terry T.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2010'))
      reference.title='Critical care nursing of older adults: Best Practices'
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('Springer')

      book_ref = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
      puts "#{book_ref}"
      expect(book_ref.to_s).to eq("Foreman, M. D., Milisen, K., & Fulner, T. T. (Eds.). (2010). Critical care nursing of older adults: Best Practices. New York, NY: Springer.")
    end

    it 'creates a book reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new('book', 1)
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

      book_ref = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
      puts "#{book_ref}"
      expect(book_ref.to_s).to eq('Estrin, M., & Malm, C. (2010). State weakness and infectious diseases. In S. E. Rice, C. Graff & C. Pascul (Eds.), Confronting poverty: Weak states and U.S. national security (pp. 167-201). Washington, DC: Brookings Institution Press.')
    end

    it 'creates a book reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2004'))
      reference.title='United Press International stylebook and guide to newswriting'
      reference.edition='4'
      reference.address=(CiteConvert::Reference::Address.new('Herndon', 'Virginia'))
      reference.publisher=('Capital Books Incorporated')

      book_ref = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
      puts "#{book_ref}"
      expect(book_ref.to_s).to eq("United Press International stylebook and guide to newswriting (4th ed.). (2004). Herndon, VA: Capital Books.")
    end

    it 'creates a book reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.add_editor(CiteConvert::Reference::Editor.new('VandenBos', 'Gary R.'))
      reference.publication_date=CiteConvert::Reference::PublicationDate.new('2007')
      reference.title='APA dictionary of psychology'
      reference.address=(CiteConvert::Reference::Address.new('Washington', 'DC'))
      reference.publisher=('American Psychological Association')

      book_ref = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
      puts "#{book_ref}"
      expect(book_ref.to_s).to eq('VandenBos, G. R. (Ed.). (2007). APA dictionary of psychology. Washington, DC: American Psychological Association.')
    end

    it 'creates a book reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.organisation = 'American Psychological Association'
      reference.publication_date=CiteConvert::Reference::PublicationDate.new('2009')
      reference.title='Publication Manual of the American Psychological Association'
      reference.edition='6'
      reference.address=(CiteConvert::Reference::Address.new('Washington', 'DC'))
      reference.publisher=('American Psychological Association')

      book_ref = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
      puts "#{book_ref}"
      expect(book_ref.to_s).to eq('American Psychological Association. (2009). Publication Manual of the American Psychological Association (6th ed.). Washington, DC: Author.')
    end

    it 'creates a book reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.organisation = 'American Medical Association'
      reference.publication_date=CiteConvert::Reference::PublicationDate.new('2007')
      reference.title='American Medical Association manual of style: A guide to authors and editors'
      reference.edition='10'
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('Oxford University Press')

      book_ref = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
      puts "#{book_ref}"
      expect(book_ref.to_s).to eq('American Medical Association. (2007). American Medical Association manual of style: A guide to authors and editors (10th ed.). New York, NY: Oxford University Press.')
    end

  end
end
