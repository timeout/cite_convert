require 'cite_convert/note/apa/author_year'
require 'cite_convert/note/apa/year'

RSpec.describe CiteConvert::Note::Note do
  describe '#initialize' do
    let(:author) { 'Barratt' }
    let(:year) { '1985' }

    it 'constructs a note' do
      note = CiteConvert::Note::Apa::AuthorYear.new(year, author)
      expect(note.to_s).to eq('Barratt, 1985')
    end

    it 'constructs a note' do
      note = CiteConvert::Note::Apa::Year.new(year)
      expect(note.to_s).to eq('1985')
    end
  end
end
