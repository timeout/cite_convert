require 'cite_convert/reference/authors'

module CiteConvert
  module Reference
    module Apa
      class Authors < Authors

        def text
          case self.size
          when 1
            self.authors.first.note
          when 2
            self.authors.map {|author| author.note}.join(' and ')
          else
            if @cited.nil?
              @cited = true
              prefix = self.authors[0..self.size - 2].map{ |author| author.note }.join(', ')
              "#{prefix} and #{self.authors.last.note}"
            else
              "#{self.authors.first.note} et al."
            end
          end
        end

        def initialed_text
          case self.size
          when 1
            self.authors.first.initialed_note
          when 2
            "#{self.authors.first.initialed_note} and #{self.authors.last.note}"
          else
            if @cited.nil?
              @cited = true
              middle = self.authors[1..self.size - 2].map{ |author| author.note }.join(', ')
              "#{self.authors.first.initialed_note}, #{middle} and #{self.authors.last.note}"
            else
              "#{self.authors.first.initialed_note} et al."
            end
          end
        end

        def note
          case self.size
          when 1
            self.authors.first.note
          when 2
            self.authors.map {|author| author.note}.join(' & ')
          else
            if @cited.nil?
              @cited = true
              prefix = self.authors[0..self.size - 2].map{ |author| author.note }.join(', ')
              "#{prefix} & #{self.authors.last.note}"
            else
              "#{self.authors.first.note} et al."
            end
          end
        end

        def initialed_note
          case self.size
          when 1
            self.authors.first.initialed_note
          when 2
            "#{self.authors.first.initialed_note} & #{self.authors.last.note}"
          else
            if @cited.nil?
              @cited = true
              middle = self.authors[1..self.size - 2].map{ |author| author.note }.join(', ')
              "#{self.authors.first.initialed_note}, #{middle} & #{self.authors.last.note}"
            else
              "#{self.authors.first.initialed_note} et al."
            end
          end
        end

        def to_s
          if self.size == 1
            "#{self.authors.first}"
          else
            "#{self.authors[0...-1].join(', ')}, & #{self.authors.last}"
          end
        end
      end
    end
  end
end
