require 'jpts_extractor'

module CiteConvert
  module Article
    class Context
      def initialize
        @text_block = JPTSExtractor::ArticlePart::Text.new
      end

      attr_accessor :start_index, :finish_index

      def add_fragment(fragment)
        @text_block.add_fragment(fragment)
      end

      def clear
        @text_block.fragments.clear
      end

      def includes_author?(author)
        @text_block.fragments.index do |fragment|
          fragment.to_s.include? author
        end
      end

      def index(&block)
        @text_block.fragments.index(&block)
      end

      def [](index)
        @text_block.fragments[index]
      end

      def delete_at(index)
        @text_block.fragments.delete_at(index)
      end

      def insert(index, fragment)
        @text_block.fragments.insert(index, fragment)
      end

      def author_fragment(author)
        @text_block.each_with_index do |fragment, index| 
          return index if fragment.to_s.include? author
        end
      end

      def each(&block)
        @text_block.each(&block)
      end

      def add_year_note(text_index, reference_list)
        text_index.reverse.each do |index|
          author = reference_list.author_text(index)
          frag_index = self.index do |frag|
            frag.to_s.include? author
          end

          fragment = self[frag_index]

          pos = fragment.to_s
            .index(/(\A|\W)#{author}(\Z|\W)/) + author.length

          prefix, suffix = fragment.to_s[0..pos], fragment.to_s[pos..-1]

          self.delete_at(frag_index)

          self.insert(frag_index, create_text(suffix.lstrip)) 
          self.insert(frag_index, right_bracket) 
          self.insert(frag_index, create_citation(reference_list.year(index)))
          self.insert(frag_index, left_bracket) 
          self.insert(frag_index, create_text(prefix.rstrip))
        end
        self
      end

      def add_full_note(note_index, reference_list)
        notes = note_index.map do |index|
          create_citation("#{reference_list.author_note(index)}, #{reference_list.year(index)}")
        end

        self.add_fragment(left_bracket)
        notes.each_with_index do |note, index|
          self.add_fragment(note)
          unless index == notes.size - 1
            self.add_fragment(create_text('; '))
          end
        end
        self.add_fragment(right_bracket)
        self
      end

      def to_s
        @text_block.to_s
      end

      private
      def left_bracket
        create_text('(')
      end

      def right_bracket
        create_text(')')
      end

      def create_text(contents)
        JPTSExtractor::ArticlePart::InlineText::InlineText.new(contents)
      end

      def create_citation(contents)
        JPTSExtractor::ArticlePart::InlineText::Citation.new(
          create_text(contents))
      end
    end
  end
end
