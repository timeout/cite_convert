require 'builder'

module Juice
  class Markup
    def initialize
      @xml = Builder::XmlMarkup.new(indent: 2)
    end

    attr_reader :xml

    def build(markup_model)
      sec_type = markup_model.first
      self.xml.tag!('p') do
        markup_model.last.each do |section|
          if sec_type == :in_text
            self.xml.tag!('xref', {"ref-type": "bibr"}, section)
            sec_type = :text
          else
            self.xml.text! section
            sec_type = :in_text
          end
        end
      end
      self.xml
    end
  end
end
