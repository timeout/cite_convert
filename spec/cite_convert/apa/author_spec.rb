require 'cite_convert/reference/apa/author'

RSpec.describe CiteConvert::Reference::Apa::Author do
  describe '#initialize' do
    it 'constructs an author' do
      CiteConvert::Reference::Apa::Author.new('Newton', 'Isaac')
    end
  end

  describe '#note' do
    it 'constructs an author note' do
      author = CiteConvert::Reference::Apa::Author.new('Newton', 'Isaac')
      expect(author.note).to eq("Newton")
    end
  end

  describe '#initialed_note' do
    it 'constructs an initialed author note' do
      author = CiteConvert::Reference::Apa::Author.new('Newton', 'Isaac')
      expect(author.initialed_note).to eq("I. Newton")
    end
  end
end
