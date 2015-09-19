require 'juice/markup'
require 'juice/paragraph'
require 'juice/markup_model'

RSpec.describe Juice::Markup do
  describe '#build' do
    it 'it marks up a model' do
      slices = [0, 4, 16]
      paragraph = Juice::Paragraph.new("What a waste of talent!")
      markup_model = Juice::MarkupModel.generate(slices, paragraph)
      markup = Juice::Markup.new
      puts markup.build(markup_model).target!
    end
  end
end
