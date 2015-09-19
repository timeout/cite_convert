require 'jpts_extractor'
require 'cite_convert/reference_list/apa'
require 'cite_convert/reference_factory/bridge'
require 'cite_convert/reference_factory/apa'
require 'cite_convert/article/paragraph'
require 'cite_convert/article/context'

module CiteConvert
  def self.deserialize(io)
    JPTSExtractor.extract(io)
  end

  def self.make_reference_list(article)
    apa_reference_list = CiteConvert::ReferenceList::Apa.new

    article.back.ref_list.each_with_index do |jpts_reference, index|
      reference = ReferenceFactory::Bridge.jpts2ref(jpts_reference, index + 1)
      apa_reference_list.add_reference(ReferenceFactory::Apa.make_reference(reference))
    end

    # debug
    # apa_reference_list.sort!
    # (1..apa_reference_list.size).each { |i| puts "(#{apa_reference_list.author_note(i)}, #{apa_reference_list.year(i)})" }
    # (1..apa_reference_list.size).each { |i| puts "(#{apa_reference_list.author_note(i)}, #{apa_reference_list.year(i)})" }
    # (1..apa_reference_list.size).each { |i| puts "#{apa_reference_list.author_text(i)} (#{apa_reference_list.year(i)})" }

    apa_reference_list
  end

  def self.translate(article)
    apa_reference_list = CiteConvert.make_reference_list(article)

     article.body.sections.map do |section|
      section.map!(section) do |block|
        if block.is_a? JPTSExtractor::ArticlePart::Text
          # puts "#{block}"
          translate_paragraph(block, apa_reference_list)
        else
          block
        end
      end
    end
    article
  end

  def self.translate_paragraph(text_block, apa_reference_list)
    paragraph = CiteConvert::Article::Paragraph.new(text_block)
    text = JPTSExtractor::ArticlePart::Text.new
    context = CiteConvert::Article::Context.new

    paragraph.each do |fragment|
      if fragment.is_a? Array

        indexed = CiteConvert::Article::ParagraphHelpers.citation_to_array(fragment)

        reference_index = CiteConvert::Article::ParagraphHelpers.array_to_index(indexed)

        text_index = CiteConvert::Article::ParagraphHelpers
          .text_index(reference_index, context, apa_reference_list)

        note_index = CiteConvert::Article::ParagraphHelpers
          .note_index(reference_index, text_index)

        unless text_index.empty?
          context.add_year_note(text_index, apa_reference_list)
        end

        unless note_index.empty?
          context.add_full_note(note_index, apa_reference_list)
        end

        # copy context into text
        context.each do |cp_frag|
          text.add_fragment(cp_frag)
        end

        # reset context
        context.clear
      elsif fragment == paragraph.last_fragment
        context.each do |cp_frag|
          text.add_fragment(cp_frag)
        end
        text.add_fragment(fragment)
      else
        context.add_fragment(fragment)
      end
    end

    # save citation
    paragraph.text = text

    text
  end
end

