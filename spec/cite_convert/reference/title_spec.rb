require 'cite_convert/reference/title'
require 'cite_convert/reference/apa/title'

RSpec.describe CiteConvert::Reference::Title do
  describe '#initialize' do
    let(:the_title) { 'Paycare: The High Cost of Insurance-based Medicine' }
    it 'constructs a title' do
      title = CiteConvert::Reference::Title.new(the_title)
      expect(title.to_s).to eq(the_title)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of an APA title' do
      title = CiteConvert::Reference::Apa::Title.new('Paycare: The High Cost of Insurance-based Medicine')
      expect(title.to_s).to eq('Paycare')
    end

    it 'returns a string representation of an APA title' do
      title = CiteConvert::Reference::Apa::Title.new("When Teachers Don't Make the Grade")
      expect(title.to_s).to eq('When Teachers')
    end

    it 'returns a string representation of an APA title' do
      title = CiteConvert::Reference::Apa::Title.new("A Long Day's Journey into Night")
      expect(title.to_s).to eq("Long Day's Journey")
    end

    it 'returns a string representation of an APA title' do
      title = CiteConvert::Reference::Apa::Title.new("From Here to Eternity")
      expect(title.to_s).to eq("Here to Eternity")
    end

    it "doesn't include any articles" do
      title = CiteConvert::Reference::Apa::Title.new("A Long Day's Journey into Night")
      expect(title.to_s).not_to include("A")
      expect(title.to_s).to eq("Long Day's Journey")

      title = CiteConvert::Reference::Apa::Title.new("Diary of an Angry Alex")
      expect(title.to_s).not_to match(/\w[Aa]n\w/)
      expect(title.to_s).to eq("Diary of Angry")

      title = CiteConvert::Reference::Apa::Title.new("The Art of Rails")
      expect(title.to_s).not_to match(/[Tt]he/)
      expect(title.to_s).to eq("Art of Rails")
    end
  end
end
