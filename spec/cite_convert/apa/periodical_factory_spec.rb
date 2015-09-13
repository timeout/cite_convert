require 'cite_convert/reference_factory/apa_periodical'
require 'cite_convert/reference'

RSpec.describe CiteConvert::ReferenceFactory::ApaPeriodical do
  describe '#make_reference' do
    it 'creates a periodical reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_author(CiteConvert::Reference::Author.new('Hughes', 'Jane C.'))
      reference.add_author(CiteConvert::Reference::Author.new('Brestan', 'Elizabeth V.'))
      reference.add_author(CiteConvert::Reference::Author.new('Christens', 'Brian D.'))
      reference.add_author(CiteConvert::Reference::Author.new('Klinger', 'Lori J.'))
      reference.add_author(CiteConvert::Reference::Author.new('Valle', 'Linda Anne'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2004'))
      reference.article_title=('Problem-solving interactions between mothers and children')
      reference.title=('Child and Family Behavior Therapy')
      reference.volume=('26')
      reference.issue=('1')
      reference.pages=CiteConvert::Reference::Pages.new('1', '16')

      apa_ref = CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
      puts "#{apa_ref}"
      expect(apa_ref.to_s).to eq("Hughes, J. C., Brestan, E. V., Christens, B. D., Klinger, L. J., & Valle, L. A., (2004). Problem-solving interactions between mothers and children. Child and Family Behavior Therapy, 26(1), 1-16.")
    end

    it 'creates a periodical reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_author(CiteConvert::Reference::Author.new('Martinez-Conde', 'Susana'))
      reference.add_author(CiteConvert::Reference::Author.new('Macknick', 'Stephen L.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007', '8'))
      reference.article_title=('Windows on the mind')
      reference.title=('Scientific American')
      reference.volume=('297')
      reference.issue=('2')
      reference.pages=CiteConvert::Reference::Pages.new('56', '63')

      apa_ref = CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
      puts "#{apa_ref}"
      expect(apa_ref.to_s).to eq("Martinez-Conde, S., & Macknick, S. L., (2007, August). Windows on the mind. Scientific American, 297(2), 56-63.")
    end

    it 'creates a periodical reference from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_author(CiteConvert::Reference::Author.new('Harrison', 'Richard L.'))
      reference.add_author(CiteConvert::Reference::Author.new('Westwood', 'Marvin J.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2009'))
      reference.article_title=('Preventing vicarious traumatization of mental health therapists: Identifying protective practices')
      reference.title=('Psychotherapy: Theory, Research, Practice, Training')
      reference.volume=('46')
      reference.pages=CiteConvert::Reference::Pages.new('203', '219')

      apa_ref = CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
      puts "#{apa_ref}"
      expect(apa_ref.to_s).to eq("Harrison, R. L., & Westwood, M. J., (2009). Preventing vicarious traumatization of mental health therapists: Identifying protective practices. Psychotherapy: Theory, Research, Practice, Training, 46, 203-219.")
    end

    it 'creates a periodical from bibliographic meta data' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_author(CiteConvert::Reference::Author.new('Nuttman-Schwartz', 'Orit'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007'))
      reference.article_title=('Is there life without work?')
      reference.title=('The International Journal of Aging and Human Development')
      reference.volume=('64')
      reference.pages=CiteConvert::Reference::Pages.new('129', '147')

      apa_ref = CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
      puts "#{apa_ref}"
      expect(apa_ref.to_s).to eq("Nuttman-Schwartz, O., (2007). Is there life without work?. The International Journal of Aging and Human Development, 64, 129-147.")
    end


  end
end
