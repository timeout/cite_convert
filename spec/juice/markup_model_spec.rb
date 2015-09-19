require 'juice/markup_model'
require 'juice/paragraph'

RSpec.describe Juice::MarkupModel do
  describe '#model' do
    it 'returns the model' do
      slices = [0, 4, 16]
      paragraph = Juice::Paragraph.new("What a waste of talent!")
      markup_model = Juice::MarkupModel.generate(slices, paragraph)
      expect(markup_model).to eq([:in_text, ["What", " a waste of ", "talent!"]])
    end
  end
end
