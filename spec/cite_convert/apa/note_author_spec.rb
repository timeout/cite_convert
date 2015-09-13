require 'cite_convert/reference/apa/note/author'

RSpec.describe CiteConvert::Reference::Apa::Note::Author do
  let(:author) { CiteConvert::Reference::Apa::Author.new("Nietzsche", "Friedrich Wilhelm") }
  describe '#initialize' do
    it 'constructs an author note' do
      CiteConvert::Reference::Apa::Note::Author.new(author)
    end
  end

  describe "#to_s" do
    it 'returns an author surname' do
      author_note = CiteConvert::Reference::Apa::Note::Author.new(author)
      expect(author_note.to_s).to eq "Nietzsche"
    end
  end
end
