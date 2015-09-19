require 'cite_convert/article/paragraph'
require 'cite_convert/article/expand'
require 'cite_convert/reference_list/apa'
require 'cite_convert/reference'
require 'cite_convert/reference_factory/apa_book'
require 'jpts_extractor'

RSpec.describe CiteConvert::Article::Paragraph do

  def text_block
    frags = [ 'Young cited patterns of rebelliousness and impulsiveness, ' +
    'indications of low self-esteem or poor achievment, and modelled ' +
    'behaviour among peers or family members [', '1', ', ', '3', '].' ]

    text = JPTSExtractor::ArticlePart::Text.new
    text.add_fragment JPTSExtractor::ArticlePart::InlineText::InlineText.new(frags.first)
    text.add_fragment JPTSExtractor::ArticlePart::InlineText::Citation.new(
      JPTSExtractor::ArticlePart::InlineText::InlineText.new(frags[1]))
    text.add_fragment JPTSExtractor::ArticlePart::InlineText::InlineText.new(frags[2])
    text.add_fragment JPTSExtractor::ArticlePart::InlineText::Citation.new(
      JPTSExtractor::ArticlePart::InlineText::InlineText.new(frags[3]))
    text.add_fragment JPTSExtractor::ArticlePart::InlineText::InlineText.new(frags.last)
    text
  end

  let(:paragraph) { CiteConvert::Article::Paragraph.new(text_block) }

  describe '#initialize' do
    it 'constructs a paragraph' do
      paragraph

      paragraph.text_fragments.each do |frag|
        puts "#{frag}: #{frag.class}"
      end
    end
  end

  # describe '#to_s' do
  #   it 'returns a string representation of the paragraph' do
  #     expect(paragraph.to_s).to eq 'Young cited patterns of rebelliousness and impulsiveness, indications of low self-esteem or poor achievment, and modelled behaviour among peers or family members [ 1 ].'
  #   end
  # end

  describe '#each' do
    let(:list) { CiteConvert::ReferenceList::Apa.new }

    def young
      reference = CiteConvert::Reference::Reference.new('book', 1)
      reference.add_author(CiteConvert::Reference::Author.new('Young', 'T. Kue'))
      reference.publication_date = CiteConvert::Reference::PublicationDate.new('2005')
      reference.edition = 2
      reference.title=('Population health: Concepts and methods')
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('Oxford University Press')

      CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
    end

    def chessick
      reference = CiteConvert::Reference::Reference.new('book', 3)
      reference.add_author(CiteConvert::Reference::Author.new('Chessick', 'Richard D.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007'))
      reference.title=('The Future of Psychoanalysis')
      reference.address=(CiteConvert::Reference::Address.new('New York', 'New York'))
      reference.publisher=('State University of New York Press')

      CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
    end


    it 'iterates over a paragraph' do
      list.add_reference(young)
      list.add_reference(chessick)

      text = JPTSExtractor::ArticlePart::Text.new
      tmp = CiteConvert::Article::Context.new

      paragraph.each do |fragment|
        if fragment.is_a? Array

          #debug
          puts "fragment is a citation: #{fragment}"
          # do something with tmp

          # update citation
          # expand citation array

          # debug
          indexed = CiteConvert::Article::ParagraphHelpers.citation_to_array(fragment)
          puts "indexed: #{indexed}"

          # debug array of indexes 
          reference_index = CiteConvert::Article::ParagraphHelpers.array_to_index(indexed)
          puts "#{reference_index}: #{reference_index.class}"

          text_index = CiteConvert::Article::ParagraphHelpers
            .text_index(reference_index, tmp, list)
          # debug
          puts "text index: #{text_index}"

          note_index = CiteConvert::Article::ParagraphHelpers
            .note_index(reference_index, text_index)
          # debug
          puts "note index: #{note_index}"

          unless text_index.empty?
            tmp.add_year_note(text_index, list)
          end

          unless note_index.empty?
            tmp.add_full_note(note_index, list)
          end

          # copy tmp into text
          tmp.each do |cp_frag|
            text.add_fragment(cp_frag)
          end

          # reset tmp
          tmp.clear
        elsif fragment == paragraph.last_fragment
          tmp.each do |cp_frag|
            text.add_fragment(cp_frag)
          end
          text.add_fragment(fragment)
        else
          tmp.add_fragment(fragment)
        end
      end

      # save citation
      paragraph.text = text

      # debug
      puts "paragraph:"
      puts paragraph
    end
  end
end
