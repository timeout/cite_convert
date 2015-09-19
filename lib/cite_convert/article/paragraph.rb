require 'cite_convert/article/context'
require 'cite_convert/article/paragraph_helpers'

module CiteConvert
  module Article
    class Paragraph
      include ParagraphHelpers
      def initialize(text_block)
        @text_block = nil
        @text_fragments = Array.new
        citations = nil
        is_citation = false

        text_block.fragments.each_with_index do |fragment, index|
          if fragment.is_a? JPTSExtractor::ArticlePart::InlineText::Citation
            is_citation = true
            remove_left_square_bracket if left_square_bracket?
          end
          if (right_square_bracket? fragment) and is_citation
            fragment.text = remove_right_square_bracket fragment
            is_citation = false
          end

          if is_citation
            citations ||= Array.new
            citations << fragment
          elsif citations
            @text_fragments << citations
            citations = nil
            @text_fragments << fragment
          else
            @text_fragments << fragment
          end
        end
      end

      attr_reader :text_fragments

      def each(&block)
        @text_fragments.each(&block)
      end

      def last_fragment
        @text_fragments.last
      end

      def text= (text)
        @text_block = JPTSExtractor::ArticlePart::Text.new
        text.fragments.each do |fragment|
          @text_block.add_fragment(fragment)
        end
      end

      def to_s
        "#{@text_block}"
          .gsub(/\(\s+/, '(')
          .gsub(/\s+\)/, ')')
          .gsub(/\s+\./, '.')
          .gsub(/\s+;./, ';')
      end

      private

      def left_square_bracket?
        !!(@text_fragments.last.text =~ /\[ *\Z/)
      end

      def remove_left_square_bracket
        pos = (@text_fragments.last.text =~ /\[ *\Z/)
        @text_fragments[-1].text = @text_fragments.last.text[0..(pos - 1)].rstrip
      end

      def right_square_bracket?(fragment)
        !!(fragment.text =~ /\A *\]/)
      end

      def remove_right_square_bracket(fragment)
        pos = (fragment.text =~ /\A *\]/)
        fragment.text[(pos + 1)..-1].lstrip
      end
    end
  end
end
