module CiteConvert
  module Reference
    class RetrievalInfo
      def initialize(from, doi = nil)
        @from, @doi = from, doi
      end

      attr_reader :from, :doi

      def doi?
        not self.doi.nil?
      end

      def to_s
        raise NotImplementedError.new("Abstract class")
      end
    end
  end
end
