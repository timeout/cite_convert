require 'cite_convert/reference/authors'
require 'cite_convert/reference/apa/author'

RSpec.describe CiteConvert::Reference::Authors do
  describe '#add_author' do
    it 'returns a string representation of the author' do
      authors = CiteConvert::Reference::Authors.new
      authors.add(CiteConvert::Reference::Author.new('Surname', 'Firstname'))
      expect(authors.to_s).to eq('Firstname Surname')
    end

    it 'returns a string representation of an APA author' do
      authors = CiteConvert::Reference::Authors.new
      authors.add(CiteConvert::Reference::Apa::Author.new('Surname', 'Firstname'))
      expect(authors.to_s).to eq('Surname, F.')
    end
  end
end
