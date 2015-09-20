require 'juice/spans'
require 'juice/markup_model'

module Juice
  class Paragraph
    def initialize(paragraph)
      @paragraph = paragraph
    end

    def length
      @paragraph.length
    end

    def [](range)
      @paragraph[range]
    end

    def scan(reference_list)
      spans = Spans.new
      reference_list.each do |apa|
        index = apa.index
        
        text_note = "#{reference_list.author_text(index)}"
        full_text_note = "#{reference_list.author_text(index)} (#{reference_list.year(index)})"
        paren_note = "#{reference_list.author_note(index)}, #{reference_list.year(index)}"
        if @paragraph.include? text_note

          index = @paragraph.index(text_note)
          if @paragraph.index(full_text_note) == index

            #debug
            puts "full_text_note: #{full_text_note}"

            spans << Span.new(index, index + full_text_note.length)
          else

            # debug
            puts "text_note: #{text_note}"

            spans << Span.new(index, index + text_note.length)
          end
          until index.nil? or index >= self.length
            index = @paragraph.index(text_note, index + 1)
            spans << Span.new(index, index + text_note.length) unless index.nil?
          end
        end
        if @paragraph.include? paren_note
          # debug
          # puts "paren_note: #{paren_note}"
          puts "YAY!!"

          index = @paragraph.index(paren_note)
          spans << Span.new(index, index + paren_note.length)
          until index.nil? or index >= self.length
            index = @paragraph.index(paren_note, index + 1)
            spans << Span.new(index, index + paren_note.length) unless index.nil?
          end
        end
      end
      spans.sort
    end

    def disect(spans)
      slices = spans.to_array
      puts "slices: #{slices}"
      MarkupModel.generate(slices, self) unless slices.first.nil? or slices.empty?
    end
  end
end
