require 'cite_convert/reference_list'

module CiteConvert
  module ReferenceList
    class Apa < ReferenceList
      def initialize
        super
      end

      def [](index)
        result = @list.find { |ref| ref.index == index }
        raise IndexError.new("Bad Index: #{index}") if result.nil?
        result
      end

      def year(index)
        ref = self[index]
        refs = @list.find_all do |reference| 
          reference.primary == ref.primary and reference.publication_date == ref.publication_date
        end
        return "#{ref.publication_date}" if refs.size == 1

        refs.sort! { |reference| reference.title }
        pos = 0
        refs.each do |reference|
          break if reference.title = ref.title
          pos += 1
        end

        "#{ref.publication_date}#{[*('a'..'z')][pos]}"
      end

      def author_note(index)
        ref = self[index]

        if ref.authors?
          found = @list.find_all do |reference|
            reference.authors.first.surname == ref.authors.first.surname unless reference.authors.first.nil?
          end

          if found.size == 1
            ref.authors_note
          else
            ref.authors_initialed_note
          end
        elsif ref.organisation?
          "#{ref.organisation.note_s}"
        else
          "#{Reference::Apa::Title.new(ref.title)}"
        end
      end

      def author_text(index)
        ref = self[index]

        if ref.authors?
        found = @list.find_all do |reference|
          # puts "nil reference" if reference.nil?
          # puts "nil authors" if reference.authors.nil?
          # puts "#{reference.authors}"
          # puts "nil first" if reference.authors.first.nil?
          reference.authors.first.surname == ref.authors.first.surname unless reference.authors.first.nil?
        end

        if found.size == 1
          ref.authors_text
        else
          ref.authors_initialed_text
        end
        elsif ref.organisation?
          "#{ref.organisation.note_s}"
        else
          "#{Reference::Apa::Title.new(ref.title)}"
        end
      end

      def to_s
        @list.map {|reference| "#{reference}" }.join("\n")
      end
    end
  end
end
