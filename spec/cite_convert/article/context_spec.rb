require 'cite_convert/article/context'
require 'cite_convert/article/paragraph'

RSpec.describe CiteConvert::Article::Context do
  let(:context) { CiteConvert::Article::Context.new }

  def text_block
    frags = [ 'Young cited patterns of rebelliousness and impulsiveness, ' +
    'indications of low self-esteem or poor achievment, and modelled ' +
    'behaviour among peers or family members [', '1', '].' ]
    text = JPTSExtractor::ArticlePart::Text.new
    text.add_fragment JPTSExtractor::ArticlePart::InlineText::InlineText.new(frags.first)
    text.add_fragment JPTSExtractor::ArticlePart::InlineText::Citation.new(
      JPTSExtractor::ArticlePart::InlineText::InlineText.new(frags[1]))
    text.add_fragment JPTSExtractor::ArticlePart::InlineText::InlineText.new(frags.last)
    text
  end

  describe '#initialize' do
    it 'constructs a context' do
      context    
    end
  end

  describe '#add_fragment' do
    it 'adds a fragment to the context (delegation)' do
      context.add_fragment(text_block.fragments.first)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the context' do
      context.add_fragment(text_block.fragments.first)
      expect(context.to_s).to eq( 'Young cited patterns of ' +
         'rebelliousness and impulsiveness, indications of low ' +
         'self-esteem or poor achievment, and modelled ' +
         'behaviour among peers or family members [')
    end
  end

  describe '#contains_author?' do
    it 'contains the author "Young"' do
      context.add_fragment(text_block.fragments.first)
      expect(context.contains_author 'Young').to eq(0)
    end

    it 'doesn\'t contain the author "Oldman"' do
      context.add_fragment(text_block.fragments.first)
      expect(context.contains_author 'Oldman').to be_nil
    end

    it 'doesn\'t contain the author "Middleton"' do
      expect(context.contains_author 'Middleton').to be_nil
    end
  end

  describe '#author_fragment' do
    it 'returns a text fragment including the author' do
      context.add_fragment(text_block.fragments.first)
      frag = context.author_fragment('Young')
      expect(frag).to eq(0)
    end
  end

  describe '#insert_year_note!' do
    it 'inserts a year note after the author' do
      context.add_fragment(text_block.fragments.first)
      context.insert_year_note!('Young', '1966')
      puts "#{context}"
    end

    it 'inserts a year note after the author' do
      paragraph = CiteConvert::Article::Paragraph.new(text_block)
      paragraph.each_citation do |intext, context|
        context.insert_year_note!('Young', '1966')
      end
    end
  end
end
