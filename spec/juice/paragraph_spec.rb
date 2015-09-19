require 'juice/paragraph'
require 'cite_convert/reference_list/apa'
require 'cite_convert/reference'
require 'cite_convert/reference_factory/apa_book'
require 'cite_convert/reference_factory/apa_periodical'
require 'cite_convert/reference_factory/apa'
require 'juice/markup'

RSpec.describe Juice::Paragraph do
  describe '#initialize' do
    it 'constructs a paragraph' do
      Juice::Paragraph.new('This is some text.')
    end
  end

  describe '#scan' do

    def chessick
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.add_author(CiteConvert::Reference::Author.new('Chessick', 'Richard D.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007'))
      reference.title=('The Future of Psychoanalysis')
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('State University of New York Press')

      CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
    end

    def lazarus
      reference = CiteConvert::Reference::Reference.new('book', 2)
      reference.add_author(CiteConvert::Reference::Author.new('Lazarus', 'Richard S.'))
      reference.add_author(CiteConvert::Reference::Author.new('Lazarus', 'Bernice N.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2006'))
      reference.title=('Coping with aging')
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('Oxford University Press')

      CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
    end

    let(:list) { CiteConvert::ReferenceList::Apa.new }

    it 'scans a paragraph for in-text citations' do
      list.add_reference(chessick)
      list.add_reference(lazarus)

      paragraph = Juice::Paragraph.new("Chessick (2007) wrote extensively on early childhood. Chessick did experiments in kindergardens throughout Maine.")
      puts paragraph.scan(list)
      expect(paragraph.scan(list).first).to eq(Juice::Span.new(0, 15))
    end
  end

  describe '#disect' do

    def henry
      reference = CiteConvert::Reference::Reference.new('journal', 1)
      reference.add_author(CiteConvert::Reference::Author.new('Henry', 'L-A'))
      reference.add_author(CiteConvert::Reference::Author.new('Nizinski', 'MS'))
      reference.add_author(CiteConvert::Reference::Author.new('Ross', 'SW'))
      reference.publication_date = CiteConvert::Reference::PublicationDate.new('2008')
      reference.article_title = 'Occurrence and biogeography of hydroids (Cnidaria: Hydrozoa) from deep-water coral habitats off the southeastern United States'
      reference.title = 'Deep Sea Res Part I: Ocean Res Pap'
      reference.volume = '55'
      reference.pages = CiteConvert::Reference::Pages.new(788, 800)

      CiteConvert::ReferenceFactory::Apa.make_reference(reference)
    end

    def beaulien
      reference = CiteConvert::Reference::Reference.new('journal', 2)
      reference.add_author(CiteConvert::Reference::Author.new('Beaulieu', 'SE'))
      reference.publication_date = CiteConvert::Reference::PublicationDate.new('2001')
      reference.article_title = 'Life on glass houses: Sponge stalk communities in the deep sea'
      reference.title = 'Mar Biol'
      reference.volume = '138'
      reference.pages = CiteConvert::Reference::Pages.new(803 , 817)

      CiteConvert::ReferenceFactory::Apa.make_reference(reference)
    end

    def roark
      reference = CiteConvert::Reference::Reference.new('journal', 3)
      reference.add_author(CiteConvert::Reference::Author.new('Roark', 'EB'))
      reference.add_author(CiteConvert::Reference::Author.new('Guilderson', 'TP'))
      reference.add_author(CiteConvert::Reference::Author.new('Dunbar', 'RB'))
      reference.add_author(CiteConvert::Reference::Author.new('Fallon', 'SJ'))
      reference.add_author(CiteConvert::Reference::Author.new('Mucciarone', 'DA'))
      reference.publication_date = CiteConvert::Reference::PublicationDate.new('2009')
      reference.article_title = 'Extreme longevity in proteinaceous deep-sea corals'
      reference.title = 'Proc Natl Acad Sci'
      reference.volume = '106'
      reference.pages = CiteConvert::Reference::Pages.new(5204, 5208)

      CiteConvert::ReferenceFactory::Apa.make_reference(reference)
    end

    def niemi
      reference = CiteConvert::Reference::Reference.new('journal', 4)
      reference.add_author(CiteConvert::Reference::Author.new('Niemi', 'JG'))
      reference.add_author(CiteConvert::Reference::Author.new('Detenbeck', 'NE'))
      reference.add_author(CiteConvert::Reference::Author.new('Perry', 'JA'))
      reference.publication_date = CiteConvert::Reference::PublicationDate.new('1990')
      reference.article_title = 'Comparative analysis of variables to measure recovery rates in streams'
      reference.title = 'Environ Toxicol Chem'
      reference.volume = '12'
      reference.pages = CiteConvert::Reference::Pages.new(1541, 1547)

      CiteConvert::ReferenceFactory::Apa.make_reference(reference)
    end

    def detenbeck
      reference = CiteConvert::Reference::Reference.new('journal', 5)
      reference.add_author(CiteConvert::Reference::Author.new('Detenbeck', 'NE'))
      reference.add_author(CiteConvert::Reference::Author.new('DeVore', 'PW'))
      reference.add_author(CiteConvert::Reference::Author.new('Niemi', 'GJ'))
      reference.add_author(CiteConvert::Reference::Author.new('Lima', 'A'))
      reference.publication_date = CiteConvert::Reference::PublicationDate.new('1992')
      reference.article_title = 'Recovery of temperate-stream fish communities from disturbance - a review of case studies and synthesis of theory'
      reference.title = 'Environ Manage'
      reference.volume = '16'
      reference.pages = CiteConvert::Reference::Pages.new(33, 53)

      CiteConvert::ReferenceFactory::Apa.make_reference(reference)
    end

    def gustavson
      reference = CiteConvert::Reference::Reference.new('journal', 6)
      reference.add_author(CiteConvert::Reference::Author.new('Gustavson', 'KE'))
      reference.add_author(CiteConvert::Reference::Author.new('Barnthouse', 'LW'))
      reference.add_author(CiteConvert::Reference::Author.new('Brierley', 'CL'))
      reference.add_author(CiteConvert::Reference::Author.new('Clark', 'EH, II'))
      reference.add_author(CiteConvert::Reference::Author.new('Ward', 'CH'))
      reference.publication_date = CiteConvert::Reference::PublicationDate.new('2007')
      reference.article_title = 'Superfund and mining megasites'
      reference.title = 'Environ Sci Technol'
      reference.volume = '41'
      reference.pages = CiteConvert::Reference::Pages.new(2667, 2672)

      CiteConvert::ReferenceFactory::Apa.make_reference(reference)
    end

    def jones_and_schmitz
      reference = CiteConvert::Reference::Reference.new('journal', 7)
      reference.add_author(CiteConvert::Reference::Author.new('Jones', 'HP'))
      reference.add_author(CiteConvert::Reference::Author.new('Schmitz', 'OJ'))
      reference.publication_date = CiteConvert::Reference::PublicationDate.new('2009')
      reference.article_title = 'Rapid recovery of damaged ecosystems'
      reference.title = 'PLoS ONE'
      reference.volume = '4'
      # warning
      reference.pages = CiteConvert::Reference::Pages.new(5653, 5655)

      CiteConvert::ReferenceFactory::Apa.make_reference(reference)
    end

    let(:list) { CiteConvert::ReferenceList::Apa.new }
    let(:markup) { Juice::Markup.new }

    it 'creates a markup model of the paragraph' do
      paragraph = Juice::Paragraph.new("Chessick (2007) wrote extensively on early childhood. Chessick did experiments in kindergardens throughout Maine.")
      spans = Juice::Spans.new
      spans << Juice::Span.new(0, 15)
      spans << Juice::Span.new(54, 62)
      expect(paragraph.disect(spans).first).to be :in_text
      expect(paragraph.disect(spans).last).to eq(["Chessick (2007)", " wrote extensively on early childhood. ", "Chessick", " did experiments in kindergardens throughout Maine."])
      # markup = Juice::Markup.new
      # markup.build(paragraph.disect(spans))
      # puts markup.xml.target!
    end

    it 'creates a markup model of the paragraph' do

      list.add_reference(henry)
      list.add_reference(beaulien)
      list.add_reference(roark)

      paragraph = Juice::Paragraph.new(
        "Another consideration with respect to the ultimate fate of" +
        "these corals is that the hydroids that have colonized the" +
        "portions of the skeleton with no remaining gorgonian soft tissue" +
        "may have a secondary deleterious impact on the remainder of the" +
        "colony. Colonization of dead coral skeleton by hydroids has been" +
        "reported many times for both littoral and deep-sea environments" +
        "(Henry et al., 2008). Similarly, hydroid colonization of" +
        "non-living glass sponge stalks in the deep sea has been" +
        "previously reported (Beaulieu 2001). Hydroid colonization was" +
        "still expanding on some Paramuricea biscaya during the visits" +
        "between October 2011 and March 2012, though the final outcome of" +
        "this process is also not known. Because cold-water corals are" +
        "slow-growing with low metabolic rates (Roark et al., 2009), it" +
        "is likely to be many years before any not-yet-obvious and" +
        "sub-acute effects of exposure to effluent from the Deepwater" +
        "Horizon blowout are fully manifested.Another consideration with" +
        "respect to the ultimate fate of these corals is that the" +
        "hydroids that have colonized the portions of the skeleton with" +
        "no remaining gorgonian soft tissue may have a secondary" +
        "deleterious impact on the remainder of the colony. Colonization" +
        "of dead coral skeleton by hydroids has been reported many times" +
        "for both littoral and deep-sea environments (Henry et al.," +
        "2008). Similarly, hydroid colonization of non-living glass" +
        "sponge stalks in the deep sea has been previously reported" +
        "(Beaulieu 2001). Hydroid colonization was still expanding on" +
        "some Paramuricea biscaya during the visits between October" +
        "2011 and March 2012, though the final outcome of this process" +
        "is also not known. Because cold-water corals are slow-growing" +
        "with low metabolic rates (Roark et al., 2009), it is likely to" +
        "be many years before any not-yet-obvious and sub-acute effects" +
        "of exposure to effluent from the Deepwater Horizon blowout are" +
        "fully manifested.")
      spans = paragraph.scan(list)
      # puts "spans: #{spans}"
      xml = markup.build(paragraph.disect(spans))
      puts xml.target!
    end

    it 'creates a markup model of the paragraph' do

      list.add_reference(niemi)
      list.add_reference(detenbeck)
      list.add_reference(jones_and_schmitz)
      list.add_reference(gustavson)

      paragraph = Juice::Paragraph.new(
      "Reviews of recovery of freshwater ecosystems have emphasized times " +
      "to recovery ( Niemi et al., 1990 ; Detenbeck et al., 1992 ; Jones " +
      "and Schmitz, 2009). In some pulse disturbances (such as accidental " +
      "spills or deliberate fish poisonings, experimental insecticide " +
      "treatments, or re-watering a de-watered channel), there is a " +
      "discrete point in time in which the direct disturbance ended, and " +
      "the time to recovery began. However, water quality improvements " +
      "from longstanding impairments on the physical scale of the " +
      "Blackbird Mine remediation are progressive and adaptive ( " +
      "Gustavson et al., 2007 ; USEPA, 2013). Without discrete starting " +
      "or finish lines to measure time to recovery, recovery times are " +
      "decidedly ambiguous.")

      puts "Author text Niemi: #{list.author_text(4)}"
      puts "Author note Niemi: #{list.author_note(4)}"

      spans = paragraph.scan(list)
      # puts "spans: #{spans}"
      xml = markup.build(paragraph.disect(spans))
      expect(xml.target!).to eq(
      "<p>\nReviews of recovery of freshwater ecosystems have emphasized times " +
      "to recovery ( <xref ref-type=\"bibr\">Niemi et al., 1990</xref> " +
      "; <xref ref-type=\"bibr\">Detenbeck et al., 1992</xref> ; " +
      "<xref ref-type=\"bibr\">Jones and Schmitz, 2009</xref>). In some " +
      "pulse disturbances (such as accidental " +
      "spills or deliberate fish poisonings, experimental insecticide " +
      "treatments, or re-watering a de-watered channel), there is a " +
      "discrete point in time in which the direct disturbance ended, and " +
      "the time to recovery began. However, water quality improvements " +
      "from longstanding impairments on the physical scale of the " +
      "Blackbird Mine remediation are progressive and adaptive ( " +
      "<xref ref-type=\"bibr\">Gustavson et al., 2007</xref> ; " +
      "USEPA, 2013). Without discrete starting or finish lines to " +
      "measure time to recovery, recovery times are decidedly ambiguous.</p>")
    end
  end
end
