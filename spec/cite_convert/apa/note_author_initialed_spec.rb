require 'cite_convert/reference/apa/note/author_initialed'

RSpec.describe CiteConvert::Reference::Apa::Note::AuthorInitialed do
  let(:author) { CiteConvert::Reference::Apa::Author.new("Nietzsche", "Friedrich Wilhelm") }
  describe '#intialize' do
    it 'constructs an initialed author' do
      CiteConvert::Reference::Apa::Note::AuthorInitialed.new(author)
    end
  end

  describe '#to_s' do
    it 'returns an initialed author' do
      author_note = CiteConvert::Reference::Apa::Note::AuthorInitialed.new(author)
      expect(author_note.to_s).to eq "F. W. Nietzsche"
    end
  end
end
