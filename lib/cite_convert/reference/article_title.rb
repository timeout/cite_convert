module CiteConvert
  module Reference
    class ArticleTitle
      def initialize(title)
        @title = title
      end

      attr_reader :title

      def include? (str)
        self.title.include? str
      end

      def downcase
        self.title.downcase
      end

      def to_s
        "#{self.title}"
      end
    end
  end
end
