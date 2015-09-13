require 'cite_convert/reference_list/apa'
require 'cite_convert/reference'
require 'cite_convert/reference_factory/apa_book'
require 'cite_convert/reference_factory/apa_periodical'

RSpec.describe CiteConvert::ReferenceList::Apa do
  let(:list) { CiteConvert::ReferenceList::Apa.new }
  
  def chessick
    reference = CiteConvert::Reference::Reference.new(1)
    reference.add_author(CiteConvert::Reference::Author.new('Chessick', 'Richard D.'))
    reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007'))
    reference.title=('The Future of Psychoanalysis')
    reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
    reference.publisher=('State University of New York Press')

    CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
  end

  def lazarus
    reference = CiteConvert::Reference::Reference.new(2)
    reference.add_author(CiteConvert::Reference::Author.new('Lazarus', 'Richard S.'))
    reference.add_author(CiteConvert::Reference::Author.new('Lazarus', 'Bernice N.'))
    reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2006'))
    reference.title=('Coping with aging')
    reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
    reference.publisher=('Oxford University Press')

    CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
  end

  def koriat_a
    reference = CiteConvert::Reference::Reference.new(3)
    reference.add_author(CiteConvert::Reference::Author.new('Koriat', 'Asher'))
    reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2008'))
    reference.article_title= 'Easy comes, easy goes? The link between learning and remembering and its exploitation in metacognition.'
    reference.title= 'Memory & Cognition'
    reference.volume= '36'
    reference.pages= CiteConvert::Reference::Pages.new(416, 428)

    CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
  end

  def koriat_b
    reference = CiteConvert::Reference::Reference.new(4)
    reference.add_author(CiteConvert::Reference::Author.new('Koriat', 'Asher'))
    reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2008'))
    reference.article_title= 'Subjective confidence in one’s answers: The consensuality principle.'
    reference.title= 'Journal of Experimental Psychology: Learning, Memory, and Cognition'
    reference.volume= '34'
    reference.pages= CiteConvert::Reference::Pages.new(945, 959)

    CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
  end

  def brown_desmond
    reference = CiteConvert::Reference::Reference.new(5)
    reference.add_author(CiteConvert::Reference::Author.new('Brown', 'Desmond J.'))
    reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2000'))
    reference.title = 'The Chemistry of heterocyclic compounds'
    reference.address = CiteConvert::Reference::Address.new('New York', 'New York')
    reference.publisher = 'Wiley'

    CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
  end

  def brown_herbert
    reference = CiteConvert::Reference::Reference.new(6)
    reference.add_author(CiteConvert::Reference::Author.new('Brown', 'Herbert Charles'))
    reference.publication_date = CiteConvert::Reference::PublicationDate.new('1977')
    reference.title = 'The nonclassical ion problem'
    reference.address = CiteConvert::Reference::Address.new('New York', 'New York')
    reference.publisher = 'Plenum Press'

    CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
  end

  def campbell_a
    reference = CiteConvert::Reference::Reference.new(7)
    reference.add_author(CiteConvert::Reference::Author.new('Campbell', 'Anne'))
    reference.add_author(CiteConvert::Reference::Author.new('Muncer', 'Steven'))
    reference.add_author(CiteConvert::Reference::Author.new('Gorman', 'Bernard'))
    reference.publication_date = CiteConvert::Reference::PublicationDate.new('1993')
    reference.article_title = 'Sex and social representations of aggression: A communal-agentic analysis'
    reference.title = 'Aggressive Behavior'
    reference.volume = '19'
    reference.pages = CiteConvert::Reference::Pages.new('125', '135')

    CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
  end

  def campbell_w
    reference = CiteConvert::Reference::Reference.new(8)
    reference.add_author(CiteConvert::Reference::Author.new('Campbell', 'W. Keith'))
    reference.add_author(CiteConvert::Reference::Author.new('Bush', 'C. P.'))
    reference.add_author(CiteConvert::Reference::Author.new('Brunell', 'Amy B.'))
    reference.publication_date = CiteConvert::Reference::PublicationDate.new('2005')
    reference.article_title = 'Understanding the social costs of narcissism: The case of the tragedy of the commons.'
    reference.title = 'Personality and Social Psychology Bulletin'
    reference.volume = '31'
    reference.pages = CiteConvert::Reference::Pages.new('1358','1368')

    CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
  end

  def organisation_apa
    reference = CiteConvert::Reference::Reference.new(9)
    reference.organisation = 'American Psychological Association'
    reference.publication_date=CiteConvert::Reference::PublicationDate.new('2009')
    reference.title='Publication Manual of the American Psychological Association'
    reference.edition='6'
    reference.address=(CiteConvert::Reference::Address.new('Washington', 'DC'))
    reference.publisher='American Psychological Association'

    CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
  end

  def organisation_ncte
    reference = CiteConvert::Reference::Reference.new(10)
    reference.organisation = 'National Council of Teachers of English'
    reference.publication_date = CiteConvert::Reference::PublicationDate.new('1996')
    reference.title = 'Standards for the English language arts'
    reference.address = CiteConvert::Reference::Address.new('Urbana', 'Illinois')
    reference.publisher = 'National Council of Teachers of English'

    CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
  end

  def dictionary
    reference = CiteConvert::Reference::Reference.new(11)
    reference.title = 'Merriam-Webster\'s collegiate dictionary'
    # reference.edition = CiteConvert::Reference::Apa::Edition.new('11')
    reference.edition = '11'
    reference.publication_date = CiteConvert::Reference::PublicationDate.new('2005')
    reference.address = CiteConvert::Reference::Address.new('Springfield', 'Massachusetts')
    reference.publisher = 'Merriam-Webster'

    CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
  end

  describe '#initialize' do
    it 'constructs an APA reference list' do
      list
    end
  end

  describe '#add_reference' do
    it 'adds a reference to the list' do
      list.add_reference(chessick)
      expect(list.size).to eq 1
      expect(list.empty?).to be_falsey
    end
  end

  describe '#year' do
    it 'returns the "year" of the reference at index' do
      list.add_reference(chessick)
      expect(list.year(1)).to eq('2007')
    end

    it 'returns the "year" of the reference at index' do
      list.add_reference(chessick)
      list.add_reference(lazarus)
      list.add_reference(koriat_a) #3
      list.add_reference(koriat_b)
      expect(list.year(3)).to eq('2008a')
    end
  end

  describe '#author' do
    it 'returns the "author" of the reference at index' do
      list.add_reference(chessick)
      expect(list.author_note(1)).to eq('Chessick')
    end

    it 'returns the "authors" of the reference at index' do
      list.add_reference(chessick)
      list.add_reference(lazarus)
      expect(list.author_note(2)).to eq('Lazarus & Lazarus')
    end

    it 'throws an IndexError on bad index' do
      list.add_reference(chessick)
      expect{list.author_note(5)}.to raise_error(IndexError)
    end

    it 'returns an initialised "author" when there are two authors with the same surname' do
      list.add_reference(chessick)
      list.add_reference(brown_herbert) #6
      list.add_reference(brown_desmond)
      list.add_reference(lazarus)

      expect(list.author_note(6)).to eq('H. C. Brown')
      expect(list.author_note(5)).to eq('D. J. Brown')
    end

    it 'returns an initialised "author" when there are two author groups with the same first author surname' do
      list.add_reference(chessick)
      list.add_reference(brown_herbert)
      list.add_reference(brown_desmond)
      list.add_reference(campbell_a) #7
      list.add_reference(campbell_w) #8

      expect(list.author_note(7)).to eq('A. Campbell, Muncer & Gorman')
    end
  end

  describe 'first note includes all names, subsequent note first name and et al.' do
    it 'returns et al on subsequent citations' do
      list.add_reference(chessick)
      list.add_reference(brown_herbert)
      list.add_reference(brown_desmond)
      list.add_reference(campbell_a) #7

      expect(list.author_note(7)).to eq('Campbell, Muncer & Gorman')
      expect(list.author_note(7)).to eq('Campbell et al.')
      expect(list.author_note(7)).to eq('Campbell et al.')
    end
  end

  describe 'first use in text includes all names, subsequent uses only first and et al.' do
    it 'returns et al on subsequent citations' do
      list.add_reference(chessick)
      list.add_reference(brown_herbert)
      list.add_reference(brown_desmond)
      list.add_reference(campbell_a) #7

      expect(list.author_text(7)).to eq('Campbell, Muncer and Gorman')
      expect(list.author_text(7)).to eq('Campbell et al.')
      expect(list.author_text(7)).to eq('Campbell et al.')
    end
  end

  describe '#sort!' do
    it 'sorts the references in the list' do
      list.add_reference(chessick)
      list.add_reference(lazarus)
      list.add_reference(koriat_a) #2
      list.add_reference(koriat_b)

      list.sort!
      expect("#{list}").to eq("#{chessick}\n#{koriat_a}\n#{koriat_b}\n#{lazarus}")
    end
  end

  describe '#[](index)' do
    it 'retrieves the element with an index' do
      list.add_reference(chessick)
      list.add_reference(lazarus)
      list.add_reference(koriat_a) #3
      list.add_reference(koriat_b)

      expect(list[3].to_s).to eq(koriat_a.to_s)
    end
  end

  describe '#author' do
    it 'returns an organisation as "author"' do
      list.add_reference(organisation_apa)
      expect(list.author_note(9)).to eq('American Psychological Association [APA]')
    end

    it 'returns an organisation as "author"' do
      list.add_reference(organisation_ncte)
      expect(list.author_note(10)).to eq('National Council of Teachers of English [NCTE]')
      expect(list.author_note(10)).to eq('NCTE') # second citation
      expect(list.author_note(10)).to eq('NCTE') # subsequent citations. . .
    end

    it 'returns the title as "author"' do
      list.add_reference(dictionary)
      expect(list.author_note(11)).to eq('Merriam-webster\'s Collegiate')
    end
  end
end
