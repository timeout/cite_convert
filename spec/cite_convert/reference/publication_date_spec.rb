require 'cite_convert/reference/publication_date'

RSpec.describe CiteConvert::Reference::PublicationDate do
  describe '#initialize' do
    it 'constructs a publication date' do
      pub_date = CiteConvert::Reference::PublicationDate.new('1985')
      expect(pub_date.to_s).to eq('1985')

      pub_date = CiteConvert::Reference::PublicationDate.new('1975', '10')
      expect(pub_date.to_s).to eq('1975.10')
    end
  end

  describe '#date' do
    it 'returns a date object' do
      pub_date = CiteConvert::Reference::PublicationDate.new('1985')
      expect(pub_date.to_date).to eq(Date.new(1985, 1, 1))

      pub_date = CiteConvert::Reference::PublicationDate.new('1975', '10')
      expect(pub_date.to_date).to eq(Date.new(1975, 10, 1))
    end
  end
end
