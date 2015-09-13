require 'cite_convert/reference/author'

RSpec.describe CiteConvert::Reference::Author do
  describe '#initialize' do
    it 'constructs an author' do
      author = CiteConvert::Reference::Author.new('Surname', 'Firstname')
      expect(author.surname).to eq('Surname')
      expect(author.given_names).to eq('Firstname')
    end
  end

  describe '#initials' do
    it 'returns the initials of a first name' do
      author = CiteConvert::Reference::Author.new('Surname', 'Firstname')
      expect(author.initials).to eq('F.')
    end

    it 'returns the initials of First Name' do
      author = CiteConvert::Reference::Author.new('Surname', 'First Name')
      expect(author.initials).to eq('F. N.')
    end

    it 'returns the initials of Anja A.' do
      author = CiteConvert::Reference::Author.new('Surname', 'Anja A.')
      expect(author.initials).to eq('A. A.')
    end
  end

  describe '#to_s' do
    it 'returns a string representation' do
      author = CiteConvert::Reference::Author.new('Surname', 'Firstname')
      expect(author.to_s).to eq('Firstname Surname')
    end
  end
end
