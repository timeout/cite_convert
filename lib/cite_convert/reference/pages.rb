module CiteConvert
  module Reference
    # TODO: Roman numerals
    class Pages
      def initialize(first, last = nil)
        @first, self.last = first.to_i, last
      end

      attr_reader :first, :last

      def last= (last)
        @last = last ? last.to_i : nil
      end

      def last?
        not @last.nil?
      end

      def to_s
        if last?
          "#{self.first}-#{self.last}"
        else
          "#{self.first}"
        end
      end
    end
  end
end
