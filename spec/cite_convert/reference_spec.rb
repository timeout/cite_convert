require 'cite_convert/reference'

RSpec.describe CiteConvert::Reference::Reference  do
  describe '#add_author' do
    let(:author) { CiteConvert::Author.new('Surname', 'Firstname') }
    it 'adds an author' do
      ref = CiteConvert::Reference::Reference.new(1)
      ref.add_author(:author)
    end
  end

  describe '#add_editor' do
    let(:editor) { CiteConvert::Editor.new('Surname', 'Firstname') }
    it 'adds an editor' do
      ref = CiteConvert::Reference::Reference.new(1)
      ref.add_editor(:editor)
    end
  end
end
