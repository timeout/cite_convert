require 'cite_convert/reference/organisation'

RSpec.describe CiteConvert::Reference::Organisation do
  describe '#initialize' do
    it 'constructs an organisation reference entry' do
      CiteConvert::Reference::Organisation.new('American Psychological Association')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the organisation' do
      org = CiteConvert::Reference::Organisation.new(
        'American Psychological Association')
      expect(org.to_s).to eq('American Psychological Association')
    end
  end

  describe '#abbrev' do
    it 'returns an abbreviation of the organisation' do
      org = CiteConvert::Reference::Organisation.new(
        'American Psychological Association')
      expect(org.abbrev).to eq('APA')
    end

    it 'returns an abbreviation of the organisation' do
      org = CiteConvert::Reference::Organisation.new(
        'National Archives and Records Administration')
      expect(org.abbrev).to eq('NARA')
    end

    it 'returns an abbreviation of the organisation' do
      org = CiteConvert::Reference::Organisation.new(
        'National Center for Complementary and Integrative Health')
      expect(org.abbrev).to eq('NCCIH')
    end

    it 'returns an abbreviation of the organisation' do
      org = CiteConvert::Reference::Organisation.new(
        'University of New South Wales')
      expect(org.abbrev).to eq('UNSW')
    end
  end
end
