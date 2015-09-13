module CiteConvert
  module Reference
    class Title
      include Comparable

      def <=>(other)
        
      end
      def initialize(title)
        @title = title
      end

      attr_reader :title

      def <=>(other)
        self.to_s <=> other.to_s
      end

      def include? (str)
        self.title.include? str
      end

      def downcase
        self.title.downcase
      end

      def index(str)
        self.title.index(str)
      end

      def [](range)
        self.title[range]
      end

      def to_s
        "#{self.title}"
      end
    end
  end
end
