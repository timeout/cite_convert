require 'cite_convert/article/expand'

module CiteConvert
  module Article
    module ParagraphHelpers
      def self.citation_to_array(fragment)
        fragment.map do |in_cite| 
          char = in_cite.text
          in_cite = (char =~ /[[:digit:]]/) ? char.to_i : char
        end
      end

      def self.array_to_index(array)
        CiteConvert::Article::Expand.new(array).blow_up
      end

      def self.text_index(index, context, reference_list)
        index.select do |entry|
          context.includes_author? reference_list.author_text(entry)
        end
      end

      def self.note_index(index, text_index)
        index - text_index
      end
    end
  end
end
